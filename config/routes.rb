Rails.application.routes.draw do
  resources :boards do
    resources :to_dos do
    	resources :cards
    end
  end
end
