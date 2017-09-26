class AttendancesController < ApplicationController
	before_action :authenticate_user!

	def index
		@attendances = current_user.attendances.order(clockin: :desc)
		@attendance = current_attendance || Attendance.new
	end

	def create
		@attendance = current_user.attendances.create(clockin: Time.zone.now)
		if @attendance
			flash[:success] = "Clocked In Successfully"
			redirect_to :back
		else
			flash[:error] = "Clock In Failed"
		end
	end

	def update
		@attendance = Attendance.find(params[:id]).update_clock
		if @attendance
			flash[:success] = "Clocked Out Successfully"
			redirect_to :back
		else
			flash[:error] = "Clock Out Failed"
		end
	end
end
