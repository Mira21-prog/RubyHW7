Rails.application.routes.draw do
  root 'posts#index'
  resources :authors
  resources :posts do
    resources :comments
  end
end
