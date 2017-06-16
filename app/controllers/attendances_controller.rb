class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      flash[:success] = "invited #{@attendance.attendee.name}"
      redirect_to @attendance.event
    else
      render "event/show"
    end
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update_attributes(attendance_params)
      flash[:success] = "Yay, par-tay!"
      redirect_to @attendance.event
    else
      flash[:notice] = "No par-tay-king of the par-tay for you..."
      @user = @attendance.attendee
      render "user/show"
    end
  end

  def attendance_params
    params.require(:attendance).permit(:attendee_id, :event_id, :activated)
  end
end
