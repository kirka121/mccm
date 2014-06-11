Mccm::Application.routes.draw do
	get "users/new"

	resources :news
	resources :videos, only: [:index, :new, :show]
	resources :sessions, only: [:new, :create, :destroy]

	resources :users do
	  member do
	    get :email
	  end
	end

	match '/presentations',		to: 'static_pages#presentations',	 via: 'get'
	match '/papers',		      to: 'static_pages#papers',	       via: 'get'	
	match '/results',		      to: 'static_pages#results',	       via: 'get'
	match '/help', 		        to: 'static_pages#help', 	         via: 'get'
	match '/about', 		      to: 'static_pages#about', 	       via: 'get'
	match '/home', 		        to: 'static_pages#home', 	         via: 'get'
	match '/register', 	      to: 'users#new', 			             via: 'get'
	match '/signin',          to: 'sessions#new',                via: 'get'
	match '/signout',         to: 'sessions#destroy',            via: 'delete'

	match '/admin_subpages/', to: 'admins#index',   via: 'get'
	match '/admin_subpages/index', to: 'admins#index', via: 'get'
	match '/admin_subpages/news', to: 'admins#news', via: 'get'
	match '/admin_subpages/settings', to: 'admins#settings', via: 'get'
	match '/admin_subpages/videos', to: 'admins#videos', via: 'get'
	match '/admin_subpages/results', to: 'admins#results', via: 'get'
	match '/admin_subpages/presentations', to: 'admins#presentations', via: 'get'
	match '/admin_subpages/help', to: 'admins#help', via: 'get'
	match '/admin_subpages/about', to: 'admins#about', via: 'get'
	match '/admin_subpages/users', to: 'admins#users', via: 'get'
	match '/admin_subpages/placeholder', to: 'admins#placeholder', via: 'get'

	root "static_pages#home"
end
