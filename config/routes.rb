Rails.application.routes.draw do

  root controller: :static, action: :static
  get "static/:file_name", controller: :static, action: :static

end
