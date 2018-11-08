Rails.application.routes.draw do
  get 'urls/new'
  get 'urls/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "url#show"

end
