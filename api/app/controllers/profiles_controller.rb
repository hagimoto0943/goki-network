class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :tool_id, :house_age, :house_floor, :house_structure, :avatar)
  end

end
