Rails.application.routes.draw do
  get 'purchases/index'
  get 'purchases/new'
  get 'purchases/create'
  get 'purchases/destroy'
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'

  devise_for :users
  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  unauthenticated do 
    root 'categories#splash', as: :unauthenticated_root
  end

  resources :categories, only: %i[index new  create] do
    resources :purchases, only: %i[index new create]
  end
  
end
