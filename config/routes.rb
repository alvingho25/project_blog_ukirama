Rails.application.routes.draw do
  root 'static_pages#index'
  get '/about', to: 'static_pages#about'
  # get '/blog_post', to: 'static_pages#blog_post'
  get '/contact', to: 'static_pages#contact'

  get '/blog_posts', to: 'blog_posts#all_post'
  get '/blog_posts/:id', to: 'blog_posts#post', :as => 'show_posts'
  resources :users do
    resources :blog_posts
  end
end
