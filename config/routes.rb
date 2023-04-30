Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get 'lord-bishops/people' => 'person#index', :as => 'person_list'
  
  get 'lord-bishops/established-churches' => 'established_church#index', :as => 'established_church_list'
end
