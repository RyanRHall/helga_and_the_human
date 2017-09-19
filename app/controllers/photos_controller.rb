class PhotosController < ApplicationController

  def index
    @photos = Photo.joins(:tags).where("tags.slug" => params[:tag])
    @photo_groups = PhotoGroup.preload(:photos).joins(:tags).where("tags.slug" => params[:tag])
  end
end
