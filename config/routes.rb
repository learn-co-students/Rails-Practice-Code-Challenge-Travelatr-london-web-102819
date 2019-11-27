Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to "posts#index"

  get "/bloggers/new", to:"bloggers#new", as:"new_blogger"
  get "/bloggers/:id", to:"bloggers#show", as: "blogger"
  post "/bloggers", to:"bloggers#create"

  resources :posts, only: [:new, :create, :show,:edit,:update]
  get "/posts/:id/likes", to:"posts#likes", as:"likes"
  resources :destinations, only: [:show] 
end
