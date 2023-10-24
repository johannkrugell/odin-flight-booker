Rails.application.routes.draw do
  
  # Set the root route to flights' index action
  root 'flights#index' 
  # This sets up the /flights route
  resources :flights, only: [:index] 
end
