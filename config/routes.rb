Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :shops do
    resources :bookings, only: [:create]
  end

  # resources :bookings, only: [:index, :show, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
