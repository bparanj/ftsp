Rails.application.routes.draw do
  resources :articles
  resources :comments

  root to: 'articles#index'  
end