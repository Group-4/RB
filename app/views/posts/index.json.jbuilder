json.array! @users do |user|
	json.user_id user.id
	json.username user.username
	json.posts user.posts do |post|
		json.post_id post.id
		json.owner post.owner
		json.url post.image_url
		json.answer post.answer
		json.hint post.hint
		json.solved post.solved
	end
end
