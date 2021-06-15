Rails.application.routes.draw do
  get 'kenders/check'
  get 'kenders/check2'
  get 'kenders/check3'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'kenders#index'
  resources :kenders, only: :index
end
