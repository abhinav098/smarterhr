class Attendance < ApplicationRecord
  belongs_to :user

  def update_clock
  	update(clockout: Time.zone.now , work: Time.zone.now - clockin)
  end

  def day
  	clockin.strftime("%b %d, %Y,%A")
  end

  def clock_in
  	clockin.strftime("%H:%M:%S")
  end

  def clock_out
  	clockout&.strftime("%H:%M:%S")
  end

  def duration
  	Time.at(work).utc.strftime("%H:%M:%S")
  end

  def status
  	self.work ? "Present" : "Absent"
  end


end
