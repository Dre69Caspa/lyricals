Collections::Application.routes.draw do
	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'

	resources :users
	resources :sessions

	#resources :collection

	resources :collections do
	    post 'search', :on => :collection
	    get 'list', :on => :collection


	end
  root to: 'articles#index'
  resources :tags
  resources :authors
  resources :articles do
    resources :comments
  end
  match '/auth/:provider/callback', to: 'sessions#create', via: :get
end