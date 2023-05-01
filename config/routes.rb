Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get 'lord-bishops/people' => 'person#index', :as => 'person_list'
  get 'lord-bishops/people/:person' => 'person#show', :as => 'person_show'
  
  get 'lord-bishops/established-churches' => 'established_church#index', :as => 'established_church_list'
   get 'lord-bishops/established-churches/:established_church' => 'established_church#show', :as => 'established_church_show'
  
  get 'lord-bishops/lord-bishop-dioceses' => 'lord_bishop_diocese#index', :as => 'lord_bishop_diocese_list'
  get 'lord-bishops/lord-bishop-dioceses/:lord_bishop_diocese' => 'lord_bishop_diocese#show', :as => 'lord_bishop_diocese_show'
  
  get 'lord-bishops/lord-bishop-diocese-incumbency-end-reasons' => 'lord_bishop_diocese_incumbency_end_reason#index', :as => 'lord_bishop_diocese_incumbency_end_reason_list'
  get 'lord-bishops/lord-bishop-diocese-incumbency-end-reasons/:lord_bishop_diocese_incumbency_end_reason' => 'lord_bishop_diocese_incumbency_end_reason#show', :as => 'lord_bishop_diocese_incumbency_end_reason_show'
end
