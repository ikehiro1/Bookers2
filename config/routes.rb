Rails.application.routes.draw do
devise_for :users
root to: "homes#top"
get 'home/about' => "homes#about"


  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
resources :users
resources :books

end
