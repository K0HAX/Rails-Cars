Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root :to => "cars#index"

  resources :cars do
    resources :maintenances
    get '/refuels/graphs' => 'refuels#graphs', :as => 'graphs'
    resources :refuels
  end

end
