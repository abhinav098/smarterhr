module ApplicationHelper

	def current_attendance
		current_user.attendances.where.not(clockin: nil).find_by(clockin: Date.today .. Time.zone.now, clockout: nil) 
	end

end
