class Users::WeeksController < Users::ApplicationController
  before_action :set_users_week, only: [:show, :edit, :update, :destroy]

  # GET /users/weeks
  # GET /users/weeks.json
  def index
    @users_weeks = Week.all
  end

  # GET /users/weeks/1
  # GET /users/weeks/1.json
  def show
  end

  # GET /users/weeks/new
  def new
    @users_week = Week.new
  end

  # GET /users/weeks/1/edit
  def edit
  end

  # POST /users/weeks
  # POST /users/weeks.json
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

  # PATCH/PUT /users/weeks/1
  # PATCH/PUT /users/weeks/1.json
  def update
    respond_to do |format|
      if @users_week.update(users_week_params)
        format.html { redirect_to @users_week, notice: 'Week was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/weeks/1
  # DELETE /users/weeks/1.json
  def destroy
    @users_week.destroy
    respond_to do |format|
      format.html { redirect_to users_weeks_url, notice: 'Week was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_week
      @users_week = Week.find_by(user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def users_week_params
      params.fetch(:users_week, {})
    end
end
