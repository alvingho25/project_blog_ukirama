Rails.application.routes.draw do
  root 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/sample_blog_post', to: 'static_pages#sample_blog_post'
  get '/contact', to: 'static_pages#contact'
  resources :users do
    resources :blog_posts
  end
end
