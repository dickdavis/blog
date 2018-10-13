Rails.application.routes.draw do
  resources :projects
  resources :links
  resources :articles
  get 'tags/:tag', to: 'articles#index', as: 'tag'
  get 'links' => 'links#index'
  get 'about' => 'welcome#about'
  get 'projects' => 'projects#index'
  root 'welcome#about'
end
