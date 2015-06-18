json.array! @users do |user|
	json.id user.id
	json.username user.username
	json.token user.access_token
	json.email user.email
	json.first user.first
	json.last user.last
end