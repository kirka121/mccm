Mccm::Application.routes.draw do
	get "users/new"

	resources :news, only: [:new, :edit, :update, :delete, :show]
	resources :videos, only: [:index, :show,:update, :delete]
	resources :sessions, only: [:new, :create, :destroy]
	resources :settings, only: [:update, :edit]

	resources :carousel_images, only: [:new, :update, :delete, :show]

	resources :users do
		member do
			get :email
			get :files
		end
	end

	resources :news do
		member do
			patch :edit
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
	match '/admin_subpages/carouselimages', to: 'admins#carouselimages', via: 'get'

	match '/admin_subpages/createnews', to: 'admins#createnews', via: 'get'
	match '/admin_subpages/editnews', to: 'admins#editnews', via: 'get'
	match '/admin_subpages/deletenews', to: 'news#delete', 	via: 'delete'

	match '/admin_subpages/createuser', to: 'admins#createuser', via: 'get'
	match '/admin_subpages/edituser', to: 'admins#edituser', via: 'get'
	match '/admin_subpages/deleteuser', to: 'admins#dodeleteuser', 	via: 'delete'
	patch '/admin_subpages/edituser' => "admins#doedituser", :as => "admin_edituser"
	post '/admin_subpages/createuser' => "admins#docreateuser", :as => "admin_createuser"

	match '/admin_subpages/createcarouselimage', to: 'admins#createcarouselimage', via: 'get'
	match '/admin_subpages/deletecarouselimage', to: 'admins#dodeletecarouselimage', via: 'delete'
	post '/admin_subpages/createcarouselimage' => "admins#docreatecarouselimage", :as => "admin_createcarouselimage"
	post '/carousel_images/new' => "carousel_images#new", :as => "carousel_new_add"

	match '/admin_subpages/createvideo', to: 'admins#createvideo', via: 'get'
	match '/admin_subpages/editvideo', to: 'admins#editvideo', via: 'get'
	match '/admin_subpages/deletevideo', to: 'admins#dodeletevideo', 	via: 'delete'

	patch '/admin_subpages/editvideo' => "admins#doeditvideo", :as => "admin_editvideo"
	post '/admin_subpages/createvideo' => "admins#docreatevideo", :as => "admin_createvideo"
	post '/admin_subpages/videos' => "videos#update", :as => "admin_edit_video_description_page"

	post 'help' => "static_pages#send_feedback", :as => "sendfeedback"

	root "static_pages#home"
end
