Rails.application.routes.draw do
  resources :leave_managements
  resources :facility_items
  devise_for :users
  resources :bookings
  resources :meeting_rooms
  resources :roles do
  	collection do
      get :user_roles_details
  	  get :assign_role
  	  post :add_role
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'bookings#index' # shortcut for the above
end
