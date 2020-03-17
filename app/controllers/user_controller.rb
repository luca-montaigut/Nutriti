class UserController < ApplicationController
  def show
    @user = current_user
  end

  def update
    height = "#{params[:meter]}#{params[:cm]}".to_i
    
    current_user.update(gender: params[:gender],
                        birthday: params[:birthday],
                        weight: params[:weight],
                        physical_activity: params[:activity],
                        height: height)

  end
end
