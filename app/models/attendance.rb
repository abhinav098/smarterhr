class Attendance < ApplicationRecord
  belongs_to :user

  def update_clock
  	update(clockout: Time.zone.now , work: Time.zone.now - clockin)
  end

end
