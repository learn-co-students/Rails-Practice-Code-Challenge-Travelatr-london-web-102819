Rails.application.routes.draw do

  resources :bloggers
  resources :posts, only: [:show, :create, :new, :edit, :update]
  resources :destinations, only: [:show]

  get 'posts/:id/like', to: "posts#like", as: 'like'

end
