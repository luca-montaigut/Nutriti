class Users::UsersController < Users::ApplicationController
  def show
  end

  def update
    current_user.update(user_params)
    current_user.week.generate
    
    if params[:commit] == "Mettre à jour mon profil"
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end

  end

  def edit 
    respond_to do |format|
      format.js {}
    end
  end
  

private

  def user_params
    params
    .require(:user)
    .permit(:first_name, :last_name, :gender, :height, :weight, :birthdate, :physical_activity, :objective, :id, :express, :vegan, :vegetarian, :porkless)
  end
end
