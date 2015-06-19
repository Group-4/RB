class UsersController < ApplicationController
  def register
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.new(username: params[:username], email: params[:email], password: passhash, points: 0 )
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

  # def scoreboard
  #   @users = User.order(score: :desc)
  # end

  # def update
  #   if current_user
  #     current_score = current_user.score
  #     current_user.update(score: current_score +100 )
  #   else
  #     authenticated
  #   end
  # end

end
