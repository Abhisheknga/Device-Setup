Devicesetup::Application.routes.draw do
  root :to => "home#index"
  
  devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock',
             :registration => 'register', :sign_up => 'cmon_let_me_in' },
             :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # get "home/index"
  # root 'home#index'
  #devise_for :users, :controllers => { : omniauth_callbacks => "omniauth_callbacks" }
  # devise_scope :user do
    # get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
end
