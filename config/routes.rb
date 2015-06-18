Rails.application.routes.draw do

post 'users/register', to: 'users#register'
post 'users/login', to: 'users#login'
get 'users', to: 'users#index'
get 'users/:username', to: 'users#find'
get 'users/:username/posts', to: 'users#posts'

##post controllers
get 'posts', to: 'posts#index'
post 'posts', to: 'posts#create'

end

# access_token
# 75ee2fecba63c4e81914e671d9cdc4bc