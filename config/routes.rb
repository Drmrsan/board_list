Rails.application.routes.draw do
  
  get 'users/index'
  get 'static_pages/about'

  devise_for :users
  root 'boards#index'

  resources :boards do
    resources :to_dos do
    	resources :cards do
    		resources :comments
    	end
    end
  end
end
