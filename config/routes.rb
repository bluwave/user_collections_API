CollectionApi::Application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :collections, except: [:new, :edit]
      # resources :collection_connections, except: [:new, :edit]
      resources :users, except: [:new, :edit] do
        get 'pdp/:pdp_id' => 'messages#pdp', on: :member
        get 'token/:token_id' => 'users#token', on: :member
        resources :collections, except: [:new, :edit] do
          resources :messages, except: [:new, :edit] do
          end
        end
      end

    end
  end


end
