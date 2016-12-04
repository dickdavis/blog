Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  get 'tags/:tag', to: 'articles#index', as: 'tag'
  get 'feed', to: 'articles#feed'
  root 'welcome#index'
end
