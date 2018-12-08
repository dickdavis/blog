Rails.application.routes.draw do
  resources :projects
  resources :links
  resources :articles
  get 'feed', to: 'feeds#feed'
  get 'tags/:tag', to: 'articles#index', as: 'tag'
  get 'about', to: 'welcome#about'
  root 'articles#index'
end
