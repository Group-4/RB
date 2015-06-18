json.array! @users do |user|
	json.user user.username
	json.email user.email
	json.array! @users.posts do |post|
		json.image_url post.image_url
		json.answer post.answer
		json.hint post.hint
		json.solved post.solved
		json.created post.created_at
		json.updated post.updated_at
	end
end
