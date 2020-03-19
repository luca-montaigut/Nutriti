class Users::DaysController < Users::ApplicationController
  before_action :set_users_day, only: [:show, :edit, :update, :destroy]

  # GET /users/days
  # GET /users/days.json
  def index
    @users_days = Day.all
  end

  # GET /users/days/1
  # GET /users/days/1.json
  def show
  end

  # GET /users/days/new
  def new
    @users_day = Day.new
  end

  # GET /users/days/1/edit
  def edit
  end

  # POST /users/days
  # POST /users/days.json
  def create
    @users_day = Day.new(users_day_params)

    respond_to do |format|
      if @users_day.save
        format.html { redirect_to @users_day, notice: 'Day was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/days/1
  # PATCH/PUT /users/days/1.json
  def update
    respond_to do |format|
      if @users_day.update(users_day_params)
        format.html { redirect_to @users_day, notice: 'Day was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/days/1
  # DELETE /users/days/1.json
  def destroy
    @users_day.destroy
    respond_to do |format|
      format.html { redirect_to users_days_url, notice: 'Day was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_day
      @users_day = Day.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_day_params
      params.fetch(:users_day, {})
    end
end
