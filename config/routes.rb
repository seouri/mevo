ActionController::Routing::Routes.draw do |map|
  map.resources :books, :has_many => :terms
  map.resources :terms, :has_many => :books

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root :controller => "home"

  # See how all your routes lay out with "rake routes"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
