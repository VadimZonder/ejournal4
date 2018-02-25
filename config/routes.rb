Rails.application.routes.draw do
  
  resources :results
  resources :static_pages
  get "table.html", to: "static_pages#table"
  get "dashboard.html", to: "static_pages#dashboard"
  get "views/static_pages/table.html.erb", to: "static_pages#table"
  
  #!!ADDED RESENTLY
    
    get 'lfilter/:lfilter', to: 'parents#lfilter'
  resources :lfilters
  get '/students/parent_filter/', to: 'students#parent_filter'
resources :students do 
  resources :pfilters
end   
  
  #get 'parent_filter/:pfilter', to: 'student#parent_filter'
  
  get 'pfilter/:pfilter', to: 'students#pfilter'
  resources :pfilters
post '/results' => 'result#parent_result'
resources :parent_results

post '/search' => 'students#search'
#if going to /parent_search then controller action parents method parent_search
post '/parent_search' => 'parents#parent_search'
 
resources :filters
resources :parent_filters
get 'parent_filter/:filter', to: 'parents#parent_filter'
get 'filter/:filter', to: 'students#filter'

devise_for :users do 
  resources:parent_filters
end 
devise_for :users do 
    resources:filters
end  
#_______________________________________________  
devise_for :students do 
  resources :results 
end 
devise_for :users do 
    resources:students
end  

resources :items
resources :results
resources :students
resources :students do 
  resources :results 
end 


  #if path/path is ran or requested => do the following
  #in order to uses devises methods like if_signedin? and view the resourse
  #of what you are looking for need this for each resourcce like view students marks in db
 
  


#resource are all the conventional routes given by default
#like index, edit, add etc.. run rake routes

  

  
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'


  resources :users
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'


  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'page/index'
    # You can have the root of your site routed with "root"
  #ROOT PAGE IS THE STATI_COTROLLER'S INDEX METHOD WHICH WILL BE RENDERED IN VIEWS
  # root 'static_pages#index'
 
 #need this for device to work
 root :to => 'static_pages#home'
  
  #devise_for :users, path: 'users'
# eg. http://localhost:3000/users/sign_in
#devise_for :admins, path: 'admins'
# eg. http://localhost:3000/admins/sign_in

#devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
#devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }

#ROUTING BROWSER PATH REQUESTS TO THE CONTROLLERS AND THEIR METHODS FOR THE CONTROLLERS TO ACTIVATE VIEWS
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


   
   #another page sample
   #get 'static_pages/sample'
   #match ':controller(/:action(/:id))', :via => :get
   #rauting uri /sample to controller static_pages method sample
   get '/sample' => 'static_pages#sample'
   		#get 'welcome/index'
		match ':controller(/:action(/:id))', :via => :get


get '/teacher' => 'users#teacher'
  get '/parent' => 'users#parent'
		get '/principal' => 'users#principal'
		  get '/teacher' => 'users#teacher'
		get '/student' => 'users#student'

#whenever /paretn/login is requested in URI (that means views/parent/login.html.erb 
#then it triggers parrent_controller that triggers login method
  get '/parents/login' => 'parents#login'
   get '/parents/loggedin' => 'parents#loggedin'
    get '/parents/loggedout' => 'parents#loggedout'
		
#whenever /teacher/login is requested in URI (that means views/teacher/login.html.erb 
#then it triggers teacher_controller that triggers login method
  get '/teachers/login' => 'teachers#login'
   get '/teachers/loggedin' => 'teachers#loggedin'
    get '/teachers/loggedout' => 'teachers#loggedout'


#TRYING TO HAVE ONE VIEW OF USERS
#get "/student", to: "users#users", as: "student"		
# get "/teacher", to: "users#users", as: "teacher"
#get '/parent' => 'users#users'
#get '/principal' => 'users#users'
	
	 

# get "/parent?"
#request.original_url # => "http://www.example.com/articles?page=2"
  # Example of regular route:
  
    #get 'sample/:controller_message' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
