Rails.application.routes.draw do
  resources :registry
  resources :participant
  resources :coordinator
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
