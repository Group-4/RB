class PostsController < ApplicationController

	before_action :authenticate_with_token!

  def create
	  url = params[:image_url]
	  answer = params[:answer].downcase.gsub(' ', '')
	  answer.gsub!(/[^0-9A-Za-z]/,'') if answer =~ /[^0-9A-Za-z]/
	  
	  @post = Post.new(image_url: url, user_id: current_user.id, answer: answer, hint: params[:hint], owner: current_user.username, solved:nil)
	  
	  if @post.save 
	  	render "create.json.jbuilder", status: :created
	  else 
	  	render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
		end
  end
  
  def index
    page_num = params[:page] || 1
    @posts = Post.order(created_at: :desc).page(page_num).per(27)
  end

  def get 
     @post = Post.find(params[:id])
  end

  def delete
    post = Post.find(params[:id])
    if current_user.id == post.user.id
      post.destroy
      render json: {msg: "post deleted"}, status: :accepted
    else
    	render json: {msg: "not authenticated to delete"}, status: :unauthorized
    end 
  end
    
end