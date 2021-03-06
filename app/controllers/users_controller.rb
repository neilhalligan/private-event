class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:info] = "failed to create user"
    end
  end

  def show
    @user = User.find(params[:id])
    @prev_events = @user.attended_events.where("date < ?", Date.today)
    @upcoming_events = @user.attended_events.where("date > ?", Date.today)
    # @invited_events = @user.attended_events.where(activated: false)
    # @invited_events = @user.attended_events.joins(:attendances).merge(Attendance.unactivated)
    @attendances_pending = @user.attendances.where(activated: false)
  end

  def login

  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
