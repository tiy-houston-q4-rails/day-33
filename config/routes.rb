Rails.application.routes.draw do

  root "albums#index"
  get "/albums/new", as: :new_album
  post "/albums" => "albums#create", as: :albums

  devise_for :users

end
