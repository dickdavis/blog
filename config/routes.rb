Rails.application.routes.draw do
  resources :projects

  resources :links do
    get 'page/:page', action: :index, on: :collection
  end

  resources :articles do
    get 'page/:page', action: :index, on: :collection
  end

  get 'feed', to: 'feeds#feed'
  get 'tags/:tag', to: 'articles#index', as: 'tag'
  get 'about', to: 'welcome#about'
  root 'articles#index'
end
