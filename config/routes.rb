Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "groups#index", as: :authenticated_root
  end

  resources :groups, only: [:index, :new, :create] do
    resources :entities, only: [:index, :new, :create]
  end

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'home#index'
end
