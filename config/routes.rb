Rails.application.routes.draw do
  
  root 'boards#index'

  resources :boards do
    resources :to_dos do
    	resources :cards
    end
  end
end
