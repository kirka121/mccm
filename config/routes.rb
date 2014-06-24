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
	match '/datasheets',		      to: 'static_pages#datasheets',	       via: 'get'	
	match '/results',		      to: 'static_pages#results',	       via: 'get'
	match '/help', 		        to: 'static_pages#help', 	         via: 'get'
	match '/about', 		      to: 'static_pages#about', 	       via: 'get'
	match '/home', 		        to: 'static_pages#home', 	         via: 'get'
	match '/register', 	      to: 'users#new', 			             via: 'get'
	match '/signin',          to: 'sessions#new',                via: 'get'
	match '/signout',         to: 'sessions#destroy',            via: 'delete'
	match '/verify', 		to: 'static_pages#verifyaccount', via: 'get'
	match '/invited', to: 'static_pages#inviteaccount', via: 'get'
	match 'admin_subpages/staticpages', to: 'admins#staticpages', via: 'get'
	match '/admin_subpages/staticpages/home', to: 'adminsstaticpages#home', via: 'get'
	match '/admin_subpages/staticpages/about', to: 'adminsstaticpages#about', via: 'get'
	match '/admin_subpages/staticpages/datasheets', to: 'adminsstaticpages#datasheets', via: 'get'
	match '/admin_subpages/staticpages/presentations_papers', to: 'adminsstaticpages#presentations_papers', via: 'get'
	match '/admin_subpages/staticpages/videos', to: 'adminsstaticpages#videos', via: 'get'

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
	match '/admin_subpages/inviteusers', to: 'admins#inviteusers', via: 'get'

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

	match '/admin_subpages/staticpages/createvideo', to: 'adminsstaticpages#createvideo', via: 'get'
	match '/admin_subpages/staticpages/editvideo', to: 'adminsstaticpages#editvideo', via: 'get'
	match '/admin_subpages/staticpages/deletevideo', to: 'adminsstaticpages#dodeletevideo', 	via: 'delete'
	patch '/admin_subpages/staticpages/editvideo' => "adminsstaticpages#doeditvideo", :as => "admin_editvideo"
	post '/admin_subpages/staticpages/createvideo' => "adminsstaticpages#docreatevideo", :as => "admin_createvideo"

	match '/admin_subpages/createsection', to: 'admins#createsection', via: 'get'
	match '/admin_subpages/deletesection', to: 'admins#dodeletesection', 	via: 'delete'
	post '/admin_subpages/createsection' => "admins#docreatesection", :as => "admin_createsection"


	post '/admin_subpages/videos' => "videos#update", :as => "admin_edit_video_description_page"

	post '/admin_subpages/inviteusers' => "admins#inviteuser", :as => "admin_inviteusers"

	post 'help' => "static_pages#send_feedback", :as => "sendfeedback"

	root "static_pages#home"
end
