class Users::DaysController < Users::ApplicationController
  before_action :set_users_day, only: [:show, :edit, :update, :destroy]

  def index
    @users_days = Day.all
  end

  def show
  end


  def edit
  end

  def create
    @days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @users_day = Day.new
    @users_day.generate(@days.sample)

    respond_to do |format|
      if @users_day.save
        format.html { redirect_to @users_day, notice: 'Day was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @users_day.update(users_day_params)
        format.html { redirect_to @users_day, notice: 'Day was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @users_day.destroy
    respond_to do |format|
      format.html { redirect_to days_path, notice: 'Day was successfully destroyed.' }
    end
  end

  private
    def set_users_day
      @users_day = Day.find(params[:id])
    end

    def users_day_params
      params.fetch(:users_day, {})
    end
end
