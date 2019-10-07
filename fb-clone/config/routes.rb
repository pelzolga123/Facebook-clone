Rails.application.routes.draw do

  root 'home#index'
  resources :posts

  authenticated :user do
      root 'posts#index', as: :authenticated_root
  end

  devise_for :users, controllers: {registrations: "registrations"}, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
