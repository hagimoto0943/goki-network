class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to profile_path(user_id: current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy!
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :name,
      profile_attributes: [:id, :avatar, :house_age, :house_floor, :house_structure, :_destroy])
  end
end
