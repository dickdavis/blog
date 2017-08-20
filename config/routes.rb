Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  get 'tags/:tag', to: 'articles#index', as: 'tag'
  get 'feed' => 'feeds#feed'
  get 'about' => 'welcome#about'
  get 'projects' => 'welcome#projects'
  get 'contact' => 'welcome#contact'
  post 'mail' => 'welcome#mail'
  root 'articles#index'
end
