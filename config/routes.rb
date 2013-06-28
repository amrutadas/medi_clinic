MediClinic::Application.routes.draw do
  
  devise_for :users

  get "home/index"
  match '/home/contact_us' => "home#contact_us"
  match '/home/about_us' => "home#about_us"
  match '/home/services' => "home#services"
  # The priority is based upon order of creation:
  # first created -> highest priority.
root :to => 'home#index'
resources :users
resources :patient_masters, :except => :show
match '/show_all_patient' => 'patient_masters#show', :as => 'show_all_patient'
match '/patient_masters/each_patient' => 'patient_masters#each_patient', :as => 'each_patient'
match '/patient_masters/export_to_csv', :to => 'patient_masters#export_to_csv', :as => 'export_to_csv'
  #resources :patient_masters do
   # post 'export_to_csv'
    #match '/import_csv/:id' => 'lists#import_csv', :as => :import_csv
  #end

#resources :patient_masters do
 #   collection do
  #    post 'show'
   # end
  #end

#resources :patient_masters do
 # collection do
  #  post 'new_user'
  # end
  #end
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
