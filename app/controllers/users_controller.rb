class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    users = User.all
    render json: UserSerializer.new(users)
  end

  # GET /users/1
  def show
    render json: UserSerializer.new(@user)
  end

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created, location: user
    else
      render json: UserSerializer.new(user).errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user)
    else
      render json: UserSerializer.new(@user).errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user
      @user.destroy
      render json: UserSerializer.new(@user)
    else
      render json: UserSerializer.new(@user).errors, status: :unprocessable_entity
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :bio, :image)
    end
  end
end
