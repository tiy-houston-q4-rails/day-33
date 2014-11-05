Rails.application.routes.draw do

  root "albums#index"
  get "/albums/new", as: :new_album
  get "/albums/tag/:tag_name" => "albums#tagged", as: :album_tag
  post "/albums" => "albums#create", as: :albums

  get "/contact" => "contact_forms#new", as: :contact
  post "/contacts" => "contact_forms#create", as: :contact_forms
  get "/thanks" => "contact_forms#thanks", as: :thanks

  devise_for :users

end
