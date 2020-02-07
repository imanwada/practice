Rails.application.routes.draw do
  root to: redirect('/users/login')
  resources :users do
    
    get "/register" => 'users#register', :on => :collection
    post "/register" => 'users#create', :on => :collection
    get "/login" => 'users#login', :on => :collection
    post "/login" => 'users#process_login', :on => :collection
    get "/dashboard" => 'users#dashboard', :on => :collection
    post "/logout" => 'users#logout', :on => :collection
    #get "/edit" => 'users#edit' , :on => :collection
  end
  namespace 'api' do
    namespace 'v1' do
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
