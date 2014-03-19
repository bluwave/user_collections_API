CollectionApi::Application.routes.draw do
  # resources :collections, except: [:new, :edit]

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :collections, except: [:new, :edit]
    end
  end


end
