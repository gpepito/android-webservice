Orangehrmapi::Application.routes.draw do
  resources :ohrm_users

  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
      match 'login'=>'login#login'
      match 'ohrmattendancerecord/get_records' => 'ohrm_attendance_records#get_records'
      match 'ohrmattendancerecord/get_time' => 'ohrm_attendance_records#get_time'
      match 'ohrmattendancerecord/punch_out'=>'ohrm_attendance_records#punch_out'
      match 'ohrmattendancerecord/punch_in'=>'ohrm_attendance_records#punch_in'
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
	namespace "api" do
		resources :ohrm_users, :defaults =>{ :format =>'json'}
	end
	namespace "api" do
		resources :ohrm_attendance_records, :defaults =>{ :format =>'json'}
	end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'ohrm_users#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
