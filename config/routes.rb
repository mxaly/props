Rails.application.routes.draw do
  root 'home#index'
  get 'app' => 'authenticated#main_app'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure'

  namespace :api do
    resources :users, only: [:index, :show]
    resources :props, only: [:index, :create] do
      resources :upvotes, only: [:create]
      get :total, on: :collection
    end
  end
end
