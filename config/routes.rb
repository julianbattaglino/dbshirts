Dbshirts::Application.routes.draw do
  resources :users
  resources :user_sessions

  resources :browse , only: [:index, :show] do
    collection { get :search }
  end
  get 'products/toggle_featured/:id' => 'products#toggle_featured'
  resources :products 
  resources :categories

  namespace :admin do
    root to: 'index#index'
  end

  get "login" => "user_sessions#new"
  get "logout" => "user_sessions#destroy"
  get 'new' => 'home#new'
  get 'featured' => 'home#featured'   
  root :to => "home#index"
end
