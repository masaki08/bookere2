Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'

   resources :books, only: [:new, :update, :edit, :create, :index, :show, :destroy]
   resources :users, only: [:update, :edit, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
