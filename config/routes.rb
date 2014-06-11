Mccm::Application.routes.draw do
  get "users/new"

  resources :news
  resources :videos, only: [:index, :new, :show]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  #match '/videos',		      to: 'static_pages#videos',	       via: 'get'
  match '/presentations',		to: 'static_pages#presentations',	 via: 'get'
  match '/papers',		      to: 'static_pages#papers',	       via: 'get'	
  match '/results',		      to: 'static_pages#results',	       via: 'get'
  match '/help', 		        to: 'static_pages#help', 	         via: 'get'
  match '/about', 		      to: 'static_pages#about', 	       via: 'get'
  match '/home', 		        to: 'static_pages#home', 	         via: 'get'
  match '/register', 	      to: 'users#new', 			             via: 'get'
  match '/signin',          to: 'sessions#new',                via: 'get'
  match '/signout',         to: 'sessions#destroy',            via: 'delete'

  match '/users/admin_subpages/page', to: 'users#admin',   via: 'get'
  
  root "static_pages#home"
end
