class Users::UsersController < Users::ApplicationController
  def show
  end

  def update  
    current_user.update(user_params)

    respond_to do |format|
         format.html {redirect_to current_user, flash:{notice: "Votre profil a été mis à jours"}}
    end
  end

private

  def user_params
    params
    .require(:user)
    .permit(:first_name, :last_name, :gender, :height, :weight, :birthdate, :physical_activity, :id)
  end
end
