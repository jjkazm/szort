Rails.application.routes.draw do
  get '/', to: "urls#new"
  get '/:short', to: "urls#show", param: :short
  get 'done/:short', to: "urls#done"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
