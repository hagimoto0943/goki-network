class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    user_bedinner = User.find_by(email: params[:email])
    if @user && user_bedinner.posts
      redirect_back_or_to posts_path, success: t('.success')
    elsif @user
      redirect_back_or_to explanation_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.success')
  end

  def guest_login
    if current_user
      redirect_to posts_path, warning: t('.alert')
    else
      random_value = SecureRandom.hex.to_s
      @guest_user = User.create!(
        name: 'ゲスト',
        email: "test_#{random_value}@example.com",
        password: random_value,
        password_confirmation: random_value
      )
      auto_login(@guest_user)
      redirect_to explanation_path, success: t('.success')
    end
  end
end
