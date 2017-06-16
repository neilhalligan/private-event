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

  def attendance_params
    params.require(:attendance).permit(:attendee_id, :event_id)
  end
end
