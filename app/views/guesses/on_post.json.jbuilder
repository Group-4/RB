json.array! @post.guesses do |guess|
	json.guess_id guess.id
	json.guess guess.guess
	json.user_id guess.user_id
end