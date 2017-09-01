require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  #validation test
  should belong_to :user

  def setup 
  	@attendance = build(:attendance)
  end

  #method testing
  test "test_update_clock_method" do
  	clockin  = @attendance.clockin
  	@attendance.update_clock
  	work_dur = (@attendance.clockout - @attendance.clockin).to_i	
  	assert_equal work_dur, @attendance.work
  end
end
