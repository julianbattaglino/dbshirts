Dbshirts::Application.routes.draw do
  resources :browse , only: [:index, :show]
  get 'products/toggle_featured/:id' => 'products#toggle_featured'
  resources :products


  resources :categories

  get 'new' => 'home#new'
  get 'featured' => 'home#featured'   
  root :to => "home#index"
end
