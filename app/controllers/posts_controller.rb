class PostsController < ApplicationController

	def create
		if current_user 
			url = params[:image_url]
			answer = params[:answer]
			@post = Post.new(image_url: url, user_id: current_user.id, answer: params[:answer], hint: params[:hint], solved: false)
			if @post.save 
				render "create.json.jbuilder", status: :created
			else 
				render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
      end
		else
			authenticate_with_token!
		end
	end
	
	def index
		@users = User.all
	end
	
end