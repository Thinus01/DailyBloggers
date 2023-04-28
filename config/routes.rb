Rails.application.routes.draw do
  root 'users#index'
  get '/users', to: 'users#index', as: :users
  get '/users/:id', to: 'users#show', as: :user
  get 'users/:user_id/posts', to: 'posts#index', as: :user_posts
  get 'users/:user_id/posts:id', to: 'posts#show', as: :user_post
  get '/posts/new', to: 'posts#new', as: :new_user_post
  post '/posts/new', to: 'posts#create'
  post '/posts/:post_id/comments', to: 'comments#create', as: :new_user_comment
  get '/posts/:post_id/comments/new', to: 'comments#new', as: :new_post_comment
  post 'likes/new', to: 'likes#create', as: :new_user_like
  get 'users/:user_id/post/:id' => 'comments#new', as: 'user_comment'
  end
  