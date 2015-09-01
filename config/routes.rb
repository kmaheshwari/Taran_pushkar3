TaranPushkar3::Application.routes.draw do

  root :to => 'welcome#index'
  resources :grp_event_winners


  resources :event_winners


  resources :race_timing_grp_evnts

  get 'search' => 'race_timing_ind_evnts#search'

  get 'result' => 'race_timing_ind_evnts#result'
  get 'hit_round' => 'race_timing_ind_evnts#hit_round'

  get 'gsearch' => 'race_timing_grp_evnts#gsearch'
  get 'ghit_round' => 'race_timing_grp_evnts#ghit_round'
  get 'gresult' => 'race_timing_grp_evnts#gresult'
  resources :race_timing_ind_evnts
  get 'winner' => 'event_winners#winner'

  get 'download_pdf' => 'event_winners#download_pdf'
  get 'gdownload_pdf' => 'grp_event_winners#gdownload_pdf'

  get 'find' => 'race_timing_ind_evnts#find'
  get 'show_timing' => 'race_timing_ind_evnts#show_timing'

  get 'gfind' => 'race_timing_grp_evnts#gfind'
  get 'gshow_timing' => 'race_timing_grp_evnts#gshow_timing'

  resources :group_events


  resources :events
  resources :competetion_levels

  resources :members
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
   

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
