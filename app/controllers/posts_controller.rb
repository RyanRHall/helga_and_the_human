class PostsController < ApplicationController

  before_action :redirect_if_unauthorized!, except: %w[ index show ]

  def index
  end

end
