class UsersController < ApplicationController
  def register
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.new(username: params[:username], email: params[:email],
                     password: passhash)
    if @user.save
      render "register.json.jbuilder", status: :created
      # render json: { user: @user.as_json(only: [:id, :email, :access_token]) },
      #   status: :created
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
      render json: { msg: "User is not authenticated" }
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
  end

end


# {
#   "username": "randym1",
#   "email": "randym1@truth.com",
#   "access_token": "2df398b06b5dac861b8699ffc5fd0027",
#   "id": 17
# }