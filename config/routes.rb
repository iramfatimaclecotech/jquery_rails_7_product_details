Rails.application.routes.draw do
  get 'subjects/index'
  get 'books/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :books do
    collection do
      delete :remove_all
    end
  end

  resources :products do
    collection do
      delete :delete_all
    end
  end


end
