Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # todo change to new and add only new and create
  root "requestors#index"

  resources :requestors
end
