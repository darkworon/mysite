Mysite::Application.routes.draw do
  scope '(:locale)' do
    get "file/:link" => "uploads#show", as: :download_page
    get "download/:link" => "download#getfile", as: :download_file
    get "view/:style/:link/:filename" => "download#view", as: :view_style
    root to: "home#index", as: :home
    controller :sessions do
        get  'login' => :new
        post 'login' => :create
        delete 'logout' => :destroy
        get 'logout' => :destroy
    end
    controller :users do
      get 'register' => :new
      post 'register' => :create
      get 'user/profile' => :profile
     # match 'user/:id/edit' => :edit, as: :edit_user, method: :get
     # match 'user/:id/update' => :update, as: :update_user
      match 'user/profile' => :update_profile, as: :update_profile
    end
    #resources :users
    #get 'home' => 'home#index'
    get 'about' => 'home#about'
    match "user/activation/resend" => "activations#resend", as: :resend_activation, method: :get
    match "user/activate/:act_link" => "activations#index", as: :activation, method: :get
    resources :uploads
    
    #match "search/resume(/:search(/:page))" => 'search#resume', :as => :search_res
    #match "search/vacancy(/:search(/:page))" => 'search#vacancy', :as => :search_vac
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

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
