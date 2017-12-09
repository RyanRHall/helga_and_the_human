class DescriptionsController < ApplicationController

  before_action :redirect_if_unauthorized!

  def create
    description = Description.new(description_params)
    if !description.save
      flash[:errors] = description.errors.full_messages
    end
    redirect_to photos_by_tag_path(description.slug)
  end

  def update
    description = Description.find(params[:id])
    description.assign_attributes(description_params)
    if !description.save
      flash[:errors] = description.errors.full_messages
    end
    redirect_to photos_by_tag_path(description.slug)
  end

  def destroy
    description = Description.find(params[:id])
    description.destroy
    redirect_to photos_by_tag_path(description.slug)
  end

  private

  def description_params
    params.require(:description).permit(:title, :content, :slug)
  end

end
