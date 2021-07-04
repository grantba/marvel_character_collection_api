class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  # POST /users
  def create
    user_info = User.find_by(username: params[:username], email: params[:email])
    if user_info.blank?
      user = User.new(user_params)
      if user.save
        render json: UserSerializer.new(user)
      else
        render json: {status: :unprocessable_entity}
      end
    elsif User.exists?(user_info.id)
      render json: UserSerializer.new(user_info)
    else
      render json: {status: :unprocessable_entity}
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user)
    else
      render json: {status: :unprocessable_entity}
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy
      render json: {status: :ok}
    else
      render json: {status: :unprocessable_entity}
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
