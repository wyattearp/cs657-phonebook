Cs657Phonebook::Application.routes.draw do

  get "search/standard"

  get "search/reverse"

  resources :entries
  resources :users do
    member do
      put :suspend
      put :unsuspend
      delete :purge
    end
    resources :phonebooks do
      resources :entries
      get :sendform
      post :sendemail
    end
  end

  resource :session, :only => [:new, :create, :destroy]

  match 'signup' => 'users#new', :as => :signup

  match 'register' => 'users#create', :as => :register

  match 'login' => 'sessions#new', :as => :login

  match 'logout' => 'sessions#destroy', :as => :logout

  match '/activate/:activation_code' => 'users#activate', :as => :activate, :activation_code => nil

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "application#index"
  # root :to => "users#show"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
