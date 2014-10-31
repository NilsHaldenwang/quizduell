Rails.application.routes.draw do
  get "presentation/index"
  get "presentation/view_state"
  get "presentation/starting"
  get "presentation/showing_question"
  get "presentation/audience_answering"
  get "presentation/team_answering"
  get "presentation/showing_team_answer"
  get "presentation/showing_audience_answer"
  get "presentation/points_and_rounds"
  get "presentation/showing_correct_answer"

  get "admin/index"
  post "admin/change_state"
  post "admin/next_question"
  post "admin/note_team_answer"
  post "admin/show_audience_answer"
  post "admin/show_correct_answer"

  get "answer/show"
  get "answer/reload_check"
  post "answer/submit_answer"

  root to: "answer#show"

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
