Rails.application.routes.draw do
  get 'tools/search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tops#index"
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'guest_login', to: 'user_sessions#guest_login'

  get 'fights', to: 'fights#index'
  post 'fight', to: 'fights#create'
  patch 'fight', to: 'fights#update'

  resources :users, only: %i[new create edit update destroy]
  resources :posts, only: %i[index new create show edit update destroy] do
    collection do
      get 'like'
    end
  end
  resources :likes, only: %i[create destroy]
  resources :fights, only: [:index] do
    resource :supports, only: %i[create destroy]
  end
  resources :profiles, only: %i[new create show update]
  mount ActionCable.server, at: '/cable'
end
