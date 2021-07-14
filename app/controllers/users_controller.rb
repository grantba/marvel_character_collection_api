class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  # POST /users
  def create
    # creates new user from user signup form
    if params["button"] === "SignUp"
      user = User.new(user_params)
      user.password = params[:password]
      if user.save
        render json: UserSerializer.new(user)
      else
        errors = user.errors.map {|message| message.message}.join(", ")
        render json: {errors: "#{errors}"}, status: :unprocessable_entity
      end
    # finds user, if exists, and returns information for update form
    elsif params["button"] === "edit-my-info"
      user_info = User.find_by(username: params[:username], email: params[:email])
      if User.exists?(user_info.id)
        render json: UserSerializer.new(user_info)
      else
        render json: {status: :unprocessable_entity}
      end
    else
      # finds user, if exists, and logs user in if authenticated
      user_info = User.find_by(username: params[:username])
      if user_info && user_info.authenticate(params[:password])
        render json: UserSerializer.new(user_info)
      else
        render json: {errors: "We could not verify your credentials. Try logging in again.\n\nIf you do not have an account already, please sign up instead."}
      end
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
      params.require(:user).permit(:username, :password, :email, :bio, :image)
    end
end
