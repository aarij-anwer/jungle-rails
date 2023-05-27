class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      # Log in the user after successful registration
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Registration successful!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
