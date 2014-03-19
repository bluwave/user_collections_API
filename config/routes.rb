CollectionApi::Application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :collections, except: [:new, :edit]
      resources :collection_connections, except: [:new, :edit]
      resources :users, except: [:new, :edit]
      resources :messages, except: [:new, :edit]
    end
  end


end
