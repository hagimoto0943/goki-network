Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  mount ActionCable.server => '/cable'
  root "tops#index"
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'guest_login', to: 'user_sessions#guest_login'

  get 'privacy', to: 'pages#privacy'
  get 'rules', to: 'pages#rules'
  get 'content', to: 'pages#content'
  get 'explanation', to: 'pages#explanation'

  resources :users, only: %i[new create edit update destroy]
  resources :posts, only: %i[index new create show edit update destroy] do
    collection do
      get 'like'
    end
  end
  resources :likes, only: %i[create destroy]
  resources :fights, only: %i[create update] do
    collection do
      get 'support'
    end
  end
  resource :supports, only: %i[create destroy]
  resources :profiles, only: %i[new create show update]
  resources :tools, only: %i[index]
end
