Rails.application.routes.draw do
  root "static_pages#home"
  # Static Pages
  get 'static_pages/home'
  get 'static_pages/about'

  # Resources
  resources :activities, only: [:new, :new, :create, :edit, :update, :destroy]
  resources :days

end
