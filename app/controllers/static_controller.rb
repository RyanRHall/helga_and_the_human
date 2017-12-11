class StaticController < ApplicationController

  def static
    file = params[:file_name]
    send file if respond_to? file
    render file
  end

  def map
    @routes = Route.all
    gon.jbuilder template: 'app/views/json/routes.json.jbuilder'
  end

end
