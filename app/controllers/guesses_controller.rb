class GuessesController < ApplicationController
  
  def index
    @guesses = Guess.all
  end

  def create
    if current_user
      post_id = params[:id]
      user_id = current_user.id
    
      @guess = Guess.new(user_id: user_id, post_id: post_id, guess: params[:guess])

      if @guess.save
        render 'create.json.jbuilder'
      else
        render json: { errors: @guess.errors.full_messages}, status: :unprocessable_entity
      end
    
    else
      authenticate_with_token!
    end
  end

  def on_post
    @post = Post.find(params[:id])
  end
  
end
