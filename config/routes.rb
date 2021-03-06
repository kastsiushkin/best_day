Rails.application.routes.draw do

  devise_for :users
  root "static_pages#home"
  # Static Pages
  get 'static_pages/home'
  get 'static_pages/about'

  # Resources
  resources :days do
    resources :activities
    resources :reviews, only: [:new, :create]
  end

end
