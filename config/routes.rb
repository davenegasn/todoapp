Rails.application.routes.draw do
  	resources :statuses do 
	  	member do
			patch 'completed'
		end
	end  
  resources :tasks
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "tasks#index"

end
