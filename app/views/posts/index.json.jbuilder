json.array! @users do |user|
	json.id user.id
	json.user user.username
	json.posts user.created_posts do |post|
		json.id post.id
		json.url post.image_url
		json.answer post.answer
		json.hint post.hint
		json.solved post.solved
	end
end
