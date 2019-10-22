Rails.application.routes.draw do

  root 'home#index'
  resources :posts

  authenticated :user do
      root 'posts#index', as: :authenticated_root
  end


  resources :users, only: %i[index show]
  get '/users/:id/profile', to: 'users#profile', as: 'profile'
  post '/friendship', to: 'users#request_friend'
  patch '/friendship', to: 'users#accept_friend'


  resources :posts do
    resources :comments
  end

  resources :posts do
    resources :likes
  end


  devise_for :users, controllers: {registrations: "registrations", omniauth_callbacks: "users/omniauth_callbacks"}, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}

  #devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
