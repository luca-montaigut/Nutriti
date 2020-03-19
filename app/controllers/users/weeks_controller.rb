class Users::WeeksController < Users::ApplicationController
  before_action :set_users_week, only: [:show, :edit, :update, :destroy]

  def index
    @weeks = Week.all
  end

  def show
  end

  def new
    @users_week = Week.new
  end

  def edit
  end

  def create
    @users_week = Week.new(users_week_params)

    respond_to do |format|
      if @users_week.save
        format.html { redirect_to @users_week, notice: 'Week was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @users_week.generate
        format.html { redirect_to @users_week, notice: 'Week was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @users_week.destroy
    respond_to do |format|
      format.html { redirect_to users_weeks_url, notice: 'Week was successfully destroyed.' }
    end
  end

  private
    def set_users_week
      @users_week = Week.find_by(user_id: current_user.id)
    end

    def users_week_params
      params.fetch(:users_week, {})
    end
end
