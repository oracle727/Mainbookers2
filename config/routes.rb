Rails.application.routes.draw do
   root 'homes#top'
  get "about" => "homes#about"
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:show,:edit,:update, :index, :destroy,:create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
