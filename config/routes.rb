Rails.application.routes.draw do
  resources :boards do
    resources :to_dos
  end
end
