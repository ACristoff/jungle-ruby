Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show, :destroy]
  end

  get "about", to: "about#index"


  # GifVault::Application.routes.draw do
      
    # This route sends requests to our naked url to the *cool* action in the *gif* controller.
    # root to: 'gif#cool'
    
    # # I've created a gif controller so I have a page I can secure later. 
    # # This is optional (as is the root to: above).
    # get '/cool' => 'gif#cool'
    # get '/sweet' => 'gif#sweet'

    # These routes will be for signup. The first renders a form in the browse, the second will 
    # receive the form and create a user in our database using the data given to us by the user.
    get '/signup' => 'users#new'
    # post '/users' => 'users#create'

      # these routes are for showing users a login form, logging them in, and logging them out.
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

    get '/signup' => 'users#new'
    post '/users' => 'users#create'

  # end


  # Add a before_filter to any controller that you want to secure. This will force user's to login before they can see the actions in this controller. I've created a gif controller below which I'm going to secure. The routes for this controller were added to the routes.rb in the beginning of this tutorial.

  # # app/controllers/gif_controller.rb
  
  # class GifController < ApplicationController
  
  #   before_filter :authorize
  
  #   def cool
  #   end
  
  #   def free
  #   end
  
  # end
  


# You can update your application layout file to show the user's name if they're logged in and some contextual links.

# <!-- app/views/layout/application.html.erb -->

# <!DOCTYPE html>
# <html>
# <head>
#   <title>GifVault</title>
#   <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
#   <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
#   <%= csrf_meta_tags %>
# </head>
# <body>

# # added these lines.
# <% if current_user %>
#   Signed in as <%= current_user.name %> | <%= link_to "Logout", '/logout' %>
# <% else %>
#   <%= link_to 'Login', '/login' %> | <%= link_to 'Signup', '/signup' %>
# <% end %>

# <%= yield %>

# </body>
# </html>









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
