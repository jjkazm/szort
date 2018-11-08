Rails.application.routes.draw do
  root "urls#new"
  post '/', to: "urls#create"
  get '/:short', to: "urls#show", as: :shorten
  get 'done/:short', to: "urls#done", as: :done
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
