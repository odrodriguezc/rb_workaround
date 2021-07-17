Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "space_requests#index"

  resources :space_requests, path: 'space-requests'
  resources :requestors
end
