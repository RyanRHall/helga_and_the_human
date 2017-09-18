Rails.application.routes.draw do

  root controller: :static, action: :map
  # get "static/:file_name", controller: :static, action: :static, as: :static
  get "photos/:tag", controller: :photos, action: :index

end
