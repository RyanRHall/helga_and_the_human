class PhotosController < ApplicationController

  before_action :redirect_if_unauthorized!, except: %w[ index ]

  def index
    @photos = Photo.joins(:tags).where("tags.slug" => params[:tag]).order("tags.priority").order("tags.id")
    @description = Description.find_by(slug: params[:tag]) || Description.new(slug: params[:tag])
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
    params.require(:photo).permit(:img_path, :thumbnail_path, :caption, :tag_slugs)
  end
end
