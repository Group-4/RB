class UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :find, :posts, :logged_in_user]

  def register
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.new(username: params[:username], email: params[:email], password: passhash)
    if @user.save
      render "register.json.jbuilder", status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def login
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.find_by(username: params[:username])
    if @user && @user.password == passhash
      render "login.json.jbuilder"
    else
      render json: { msg: "User is not authenticated" }, status: :unauthorized
    end
  end

  def index
    @users = User.all
    render "index.json.jbuilder"
  end

  def find
    @user = User.find_by(username: params[:username])
  end

  def posts
    @user = User.find_by(username: params[:username])
  end

  def logged_in_user
    render json: current_user, status: :ok
  end

  def destroy
    user = User.find(params[:id])
    if current_user.id == user.id
      user.destroy
      render json: {msg: "user deleted"}, status: :ok
    else
      render json: {msg: "not authenticated to delete"}, status: :unauthorized
    end 
  end

  def solved
    page = params[:page] || 1
    user = User.find_by(username: params[:username])
    @solved = user.get_solved(page)
    render json: @solved, status: :ok
  end

  def unsolved
    page = params[:page] || 1
    top = params[:sort]
    user = User.find_by(username: params[:username])
    @unsolved = user.get_unsolved(page, top)
    render json: @unsolved, status: :ok
  end

  def leaderboard
    @users = User.order(points: :desc).page(1).per(10)
    render status: :created
  end

  def guesses
    user = User.find_by(username: params[:username])
    @guesses = user.guesses
    render json: @guesses, status: :ok
  end

  def post_guesses
    user = User.find_by(username: params[:username])
    post = Post.find(params[:post_id])
    if post && user
      guesses = post.guesses.where(user_id: user.id)
      binding.pry
      if guesses
        render json: guesses, status: :ok
      else
        render json: {msg: "No guesses on this post"}
      end
    else
      render json: {msg: "No match for user or post"}
    end
  end

end
