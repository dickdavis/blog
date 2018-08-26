Rails.application.routes.draw do
  resources :posts
  resources :articles
  get 'tags/:tag', to: 'articles#index', as: 'tag'
  get 'feed' => 'feeds#feed'
  get 'about' => 'welcome#about'
  get 'projects' => 'welcome#projects'
  root 'posts#index'
end
