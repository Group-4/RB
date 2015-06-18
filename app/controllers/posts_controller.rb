class PostsController < ApplicationController

    def create
        if current_user 
            url = params[:image_url]
            answer = params[:answer]
            @post = Post.new(image_url: url, user_id: current_user.id, answer: params[:answer], hint: params[:hint], owner: current_user.username, solved:nil)
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
        page_num = params[:page] || 1
        @posts = Post.order(created_at: :desc).page(page_num)
    end

    def get 
        @post = Post.find(params[:id])
    end

    def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
    end
    
end