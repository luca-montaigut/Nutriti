class Users::BreakfastController < ApplicationController
  before_action :set_users_breakfast, only: [:show, :edit, :update]

  def show
    
  end

  def edit
  end

  def update
  end



  private
    def set_users_breakfast
      @users_breakfast = current_user.breakfast
    end

    def users_breakfast_params
      params.fetch(:users_breakfast, {})
    end
end
