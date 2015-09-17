Rottenpotatoes::Application.routes.draw do
	resources :movies do
		resources :reviews
	end

	resources :moviegoers do
		resource :reviews
	end
		
	root :to => redirect('/movies')
#	root :to => redirect("#{ Rails.application.config.action_controller.relative_url_root}/movies")
		match "/signout" => "sessions#destroy", :as => :signout
		match "/auth/:provider/callback" => "sessions#create" , :as => :signin
		
	get  'auth/:provider/callback' => 'sessions#create'   , :as => 'login'
	match 'logout' => 'sessions#destroy'
	get  'auth/failure' => 'sessions#failure'

end

#