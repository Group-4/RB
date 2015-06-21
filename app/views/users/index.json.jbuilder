json.array! @users do |user|
	json.id user.id
	json.username user.username
	json.email user.email
	json.access_token user.access_token
	json.first user.first
	json.last user.last
	json.posts user.count_posts
	json.points user.points
	json.guess_count user.guess_count
	json.correct_count user.correct_count
	json.win_percent user.win_percent
end