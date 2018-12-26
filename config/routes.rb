Rails.application.routes.draw do
  resources :activity_categories
  ##
  # Routes for articles.
  resources :articles do
    get 'page/:page', action: :index, on: :collection
  end

  ##
  # Routes for links.
  resources :links do
    get 'page/:page', action: :index, on: :collection
  end

  ##
  # Routes for projects.
  resources :projects

  ##
  # Routes for activities.
  resources :activity_categories
  resources :activities do
    member do
      get 'complete'
      post 'revert'
    end
    collection do
      get 'export', defaults: { format: 'json' }
    end
  end

  ##
  # Route to hourglass dashboard.
  get 'hourglass', to: 'hourglass#index', as: 'hourglass'

  ##
  # Route to articles feed.
  get 'feed', to: 'feeds#feed'

  ##
  # Route to articles index for tags.
  get 'tags/:tag', to: 'articles#index', as: 'tag'

  ##
  # Route to about page.
  get 'about', to: 'welcome#about'

  ##
  # Root route to articles index.
  root 'articles#index'
end
