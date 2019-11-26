Rails.application.routes.draw do
  resources :bloggers, only: [:index, :show, :edit, :new, :create]
  resources :posts, only: [:index, :show, :edit, :new, :update, :create]
  resources :destinations, only: [:index, :show, :edit, :new, :update, :create]
  post "/post/:id/liked", to: "posts#liked", as: "post_liked"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
