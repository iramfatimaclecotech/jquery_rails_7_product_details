Rails.application.routes.draw do
  resources :rooms

  # mount ActionCable.server, at: '/cable'
  
  get 'comments/index'
  get 'posts/index'
  mount Ckeditor::Engine => '/ckeditor'
  get 'users/index'
  get 'details/index'
  get 'subjects/index'
  get 'books/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "posts#index"
  resources :posts do
    resources :comments
  end
  
  #root "home#index"
  get "home/dropdown"
  get "home/show_data"
  
  resources :books do
    collection do
      delete :remove_all
    end
  end
  resources :users
    
  resources :products do
    collection do
      delete :delete_all
    end
    
      resources :details 
    
  end


end
