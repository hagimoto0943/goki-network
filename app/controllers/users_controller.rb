class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(user_id: current_user.id), success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    redirect_to root_path, success: t('.success')
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :name,
      profile_attributes: [:id, :avatar, :house_age, :house_floor, :house_structure, :_destroy]
    )
  end
end
