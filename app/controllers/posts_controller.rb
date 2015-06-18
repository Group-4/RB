class PostsController < ApplicationController

	def create
		if current_user 
			url = params[:image_url]
			answer = params[:answer]
			@post = Post.create(image_url: url, user_id: current_user.id, answer: params[:answer], hint: params[:hint], solved: false)
			render "create.json.jbuilder"
		else
			authenticate_with_token!
		end
	end
	
	def index
	end
end