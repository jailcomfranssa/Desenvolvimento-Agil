class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]
  before_action :set_produto, only: [:show, :update, :destroy]


 

  # REGISTER
  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {user_id: @user.id,name: @user.name, is_user: @user.is_user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user_id: @user.id,name: @user.name, is_user: @user.is_user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

  def index
    @user = User.all

    render json: @user
  end

  def show
    render json: @user
  end


  # PATCH/PUT 
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :password, :email, :is_user, :nascimento, :tipo, :documento)
  end

end