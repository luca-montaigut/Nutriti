class Users::UsersController < Users::ApplicationController
  def show
  end

  def update
    puts "a" * 78
    current_user.update(user_params)
    current_user.week.generate

    redirect_to root_path
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
    .permit(:first_name, :last_name, :gender, :height, :weight, :birthdate, :physical_activity, :id, :express, :vegan, :vegetarian, :porkless)
  end
end
