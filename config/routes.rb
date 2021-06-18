Rails.application.routes.draw do
  get 'kenders/kendo'
  get 'kenders/kenzyutu'
  get 'kenders/kendougu'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'kenders#index'
  resources :kenders, only: :index
  resources :kenzyutus do
    resources :messages, only: :create
    collection do
      get 'search'
    end
  end
  resources :kendogus do
    resources :speaks, only: :create
    collection do
      get 'search'
    end
  end
  resources :kensis do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
  