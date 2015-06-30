Rails.application.routes.draw do

  root "static_pages#home"
  # Static Pages
  get 'static_pages/home'
  get 'static_pages/about'

  # Resources
  resources :days do
    resources :activities
  end

end
