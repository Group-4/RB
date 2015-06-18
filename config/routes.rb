Rails.application.routes.draw do


scope defaults: { format: 'json'} do
	post 'users/register', to: 'users#register'
	post 'users/login', to: 'users#login'

	get 'users', to: 'users#index'
	get 'users/:username', to: 'users#find'
	get 'users/:username/posts', to: 'users#posts'
	# patch 'users/:username', to: 'users#update'

	##post controllers
	get 'posts', to: 'posts#index'
	post 'posts', to: 'posts#create'
	get 'posts/:id', to: 'posts#get'
	delete 'posts/:id', to: 'posts#destroy'

	##guess routes
	get 'guesses', to: 'guesses#index'
	get 'posts/:id/guesses', to: 'guesses#on_post'
	post 'posts/:id/guesses', to: 'guesses#create'
end



# get 'leaderboard', to: 'users#leaderboard'


end

# access_token
# 75ee2fecba63c4e81914e671d9cdc4bc