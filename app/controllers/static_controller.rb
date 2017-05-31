class StaticController < ApplicationController

  def static
    file = request.path == "/" ? :map : params[:file_name]
    render file
  end

end
