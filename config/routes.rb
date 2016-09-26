Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index' => 'welcome#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get 'admins/login' => 'sessions#new'
  post 'admins/login' => 'sessions#create'
  get 'admins/logout' => 'sessions#destroy'

  get 'members/login' => 'member_sessions#new'
  post 'members/login'=> 'member_sessions#create'
  get 'members/logout'=> 'member_sessions#destroy'


  get 'schedules/history' => 'schedules#history'
  get 'schedules/show_room' => 'schedules#show_room'
  get 'admins/members/profile' => 'admins#members_profile'

  resources :admins, :members, :schedules

  resources :rooms, param: :number

  get 'admins/show/admins' => 'admins#show_admins'
  get 'admins/show/members' => 'admins#show_members'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
