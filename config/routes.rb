Rails.application.routes.draw do
 
  
  resources :projects do
  get "/index" => 'projects#index',:on => :collection
  get "/new" => 'projects#new',:on => :collection

  end
  root to: redirect('/users/login')
  resources :users do
    
    get "/register" => 'users#register', :on => :collection
    post "/register" => 'users#create', :on => :collection
    get "/login" => 'users#login', :on => :collection
    post "/login" => 'users#process_login', :on => :collection
    get "/dashboard" => 'users#dashboard', :on => :collection
    post "/logout" => 'users#logout', :on => :collection
    get ":id/edit" => 'users#edit' , :on => :collection
    patch "/edit/:id" => 'users#update' , :on => :collection
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
