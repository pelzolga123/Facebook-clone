Rails.application.routes.draw do

  root 'home#index'
  resources :posts

  authenticated :user do
      root 'posts#index', as: :authenticated_root
  end

  
  
  

  # get '/users/auth/facebook/callback', to: redirect('/auth/facebook/callback')

  resources :posts do
    resources :comments
  end
  
  resources :posts do
    resources :likes
  end

  resources :authentications, only: [:destroy]

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show]
  get '/users/:id/profile', to: 'users#profile', as: 'profile'
  post '/friendship', to: 'users#request_friend'
  patch '/friendship', to: 'users#accept_friend'
end
