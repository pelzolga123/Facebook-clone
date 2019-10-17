Rails.application.routes.draw do

  root 'home#index'
  resources :posts

  authenticated :user do
      root 'posts#index', as: :authenticated_root
  end

  
  resources :users, only: %i[index show]
  get '/users/:id/profile', to: 'users#profile', as: 'profile'

  resources :posts do
    resources :comments
  end
  
  resources :posts do
    resources :likes
  end

  devise_for :users, controllers: {registrations: "registrations"}, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
