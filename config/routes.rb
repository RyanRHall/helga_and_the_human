Rails.application.routes.draw do

  # root
  root controller: :static, action: :map

  # static
  get "static/:file_name", controller: :static, action: :static, as: :static

  # map
  resources :geo_points, only: %w[ new create edit update destroy ]
  resources :routes, only: %w[ index ]
  post :mass_update_routes, action: :mass_update, controller: :routes, as: :mass_update_routes

  # photos
  resources :photos, only: %w[ new create edit update destroy ]
  get "photos/:tag", controller: :photos, action: :index, as: :photos_by_tag
  get "photos/arrange/:tag", controller: :photos, action: :arrange, as: :arrange_photos
  patch "photos/arrange/:tag", controller: :photos, action: :arrange
  resources :descriptions, only: %w[ create update destroy ]

  # blog
  resources :posts, only: %w[ index ]

  # session
  post :login, controller: :sessions
  delete :logout, controller: :sessions

end
