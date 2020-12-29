Rails.application.routes.draw do
  get 'sessions/new'
  root 'posts#index'
  get   'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :authors
  get   'signup'   => 'authors#new'
  resources :posts do
    resources :comments
  end
end
