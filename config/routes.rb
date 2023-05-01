Rails.application.routes.draw do
  get 'details/index'
  get 'subjects/index'
  get 'books/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  
  #resources :homes
  
  root "home#index"
  get "home/dropdown"
  get "home/show_data"
  
  resources :books do
    collection do
      delete :remove_all
    end
  end

  resources :products do
    collection do
      delete :delete_all
    end
    
      resources :details 
    
  end


end
