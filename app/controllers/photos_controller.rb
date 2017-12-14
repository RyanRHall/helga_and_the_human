class PhotosController < ApplicationController

  # CLOUDINARY_TOKENS = {
  #   cloud_name: Figaro.env.cloudinary_cloud_name,
  #   api_key: Figaro.env.cloudinary_api_key,
  #   api_secret: Figaro.env.cloudinary_api_secret,
  # }

  before_action :redirect_if_unauthorized!, except: %w[ index ]

  def index
    @photos = Photo.joins(:tags).where("tags.slug" => params[:tag]).order("tags.priority").order("tags.id")
    @description = Description.find_by(slug: params[:tag]) || Description.new(slug: params[:tag])
    @geo_points = GeoPoint.where.not(slug: params[:tag]).order(:name)
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    photo = Photo.new(photo_params)
    if photo.save
      slug = photo.tags.first.slug
      redirect_to photos_by_tag_path(slug)
    else
      flash[:errors] = photo.errors.full_messages
      redirect_to new_photo_path
    end
  end

  def update
    photo = Photo.find(params[:id])
    photo.assign_attributes(photo_params)
    if photo.save
      slug = photo.tags.first.slug
      redirect_to photos_by_tag_path(slug)
    else
      flash[:errors] = photo.errors.full_messages
      redirect_to edit_photo_path
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy!
    Cloudinary::Uploader.destroy(photo.public_id, self.class::CLOUDINARY_TOKENS)
    redirect_to photos_by_tag_path(photo.tags.first.slug)
  end

  def arrange
    if !logged_in?
      redirect_to root_url
    elsif request.get?
      @tags = Tag.preload(:photo).where("tags.slug" => params[:tag]).order("tags.priority").order("tags.id")
    elsif request.patch?
      tag_ids = params[:tag_ids].map(&:to_i)
      tags = Tag.where("tags.slug" => params[:tag])
      tags.each do |tag|
        tag.update!(priority: tag_ids.find_index(tag.id) + 1)
      end
      redirect_to photos_by_tag_path(params[:tag])
    else
      raise "Invalid method for action"
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:public_id, :caption, :tag_slugs)
  end
end
