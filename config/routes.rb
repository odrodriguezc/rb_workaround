Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root '/home', to: 'home#index'

  resources :requestors, only: [:new, :create]
  get 'space_requests/:id/confirm', to: 'space_requests#confirm', as: 'confirm_space_request'
  get 'space_requests/:id/re_confirm', to: 'space_requests#re_confirm', as: 're_confirm_space_request'

end
