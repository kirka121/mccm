Mccm::Application.routes.draw do

  get "users/new"
  
  match '/help', 		to: 'static_pages#help', 	via: 'get'
  match '/about', 		to: 'static_pages#about', 	via: 'get'
  match '/home', 		to: 'static_pages#home', 	via: 'get'
  match '/register', 	to: 'users#new', 			via: 'get'
  
  root "static_pages#home" 
end
