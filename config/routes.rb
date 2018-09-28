Rails.application.routes.draw do
  # static pages
  root 'static_pages#index'
  get '/about', to: 'static_pages#about'
  # get '/blog_post', to: 'static_pages#blog_post'
  get '/contact', to: 'static_pages#contact'
  get '/recent_blog', to: 'static_pages#search'
  get '/blog_posts', to: 'blog_posts#all_post'
  get '/blog_posts/:id', to: 'blog_posts#post', :as => 'show_posts'

  # user and post
  resources :users do
    resources :blog_posts
  end

  # session login & friends
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#delete'
end
