Rails.application.routes.draw do

post 'users/register', to: 'users#register'
post 'users/login', to: 'users#login'

end
