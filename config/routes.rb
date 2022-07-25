Rails.application.routes.draw do
  devise_for :users
  get 'homes/top'
  get 'homes/index'
  get 'homes/show'
  get 'homes/new'
  
   resources :books, only: [:new, :update, :edit, :create, :index, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
