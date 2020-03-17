class UserController < ApplicationController
  def show
  end

  def update  
    current_user.update(user_params)

    redirect_to user_path(current_user.id), flash:{notice: "Votre profil a été mis à jours"}
  end

private

  def user_params
    params
    .require(:user)
    .permit(:first_name, :last_name, :gender, :height, :weight, :birthday, :physical_activity, :id)
  end
end
