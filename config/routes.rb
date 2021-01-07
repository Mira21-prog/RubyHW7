Rails.application.routes.draw do
  get 'sessions/new'
  root 'posts#index'
  get 'login', to: 'sessions#new'
  post   'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :authors
  get 'signup', to: 'authors#new'
  get '/search', to: 'posts#index', as: 'search_posts'
  resources :posts do
    resources :comments
  end
  post 'comments/:comment_id/votes', controller: :author_comment_votes, action: :create
end
