Rails.application.routes.draw do
  resources :links
  resources :articles
  get 'tags/:tag', to: 'articles#index', as: 'tag'
  get 'links' => 'links#index'
  get 'about' => 'welcome#about'
  get 'projects' => 'welcome#projects'
  root 'welcome#about'
end
