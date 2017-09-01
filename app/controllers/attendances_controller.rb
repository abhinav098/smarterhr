class AttendancesController < ApplicationController
	before_action :authenticate_user!

	def index
		@attendances = current_user.attendances
		@attendance = current_attendance || Attendance.new
	end

	def create
		@attendance = current_user.attendances.create(clockin: Time.zone.now)
		redirect_to :back if @attendance 

	end

	def update
		@attendance = Attendance.find(params[:id]).update_clock
		redirect_to :back
	end

end
