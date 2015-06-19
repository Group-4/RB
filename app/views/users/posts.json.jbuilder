json.user_id @user.id
json.username @user.username
json.points @user.points
json.posts @user.posts do |post|
	json.post_id post.id
	json.url post.image_url
	json.answer post.answer
	json.hint post.hint
	json.solved post.solved
	json.solved_by post.solved_by	
end
