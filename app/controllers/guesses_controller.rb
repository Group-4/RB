class GuessesController < ApplicationController

  before_action :authenticate_with_token!
  
  def index
    @guesses = Guess.all
  end

  def create
    post_id = params[:id]
    user_id = current_user.id
    guess = params[:guess]
    guess.gsub!(/[^0-9A-Za-z]/, '').downcase!
  
    @guess = Guess.new(user_id: user_id, post_id: post_id, guess: guess)

    if @guess.save
      @guess.check_solution
      render 'create.json.jbuilder'
    else
      render json: { errors: @guess.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def on_post
    @post = Post.find(params[:id])
  end
  
end
