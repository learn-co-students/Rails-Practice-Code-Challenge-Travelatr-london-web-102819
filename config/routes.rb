Rails.application.routes.draw do
  resources :posts, except: [:delete, :index]
  resources :destinations, only: :show
  resources :bloggers, only: [:show, :new, :create]

  post '/posts/:id/like', to: "posts#like", as: :like
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
