Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  get 'tags/:tag', to: 'articles#index', as: 'tag'
  get 'feed' => 'feeds#feed'
  root 'welcome#index'
end
