require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  #validation test
  should belong_to :user

  def setup 
  	@attendance = build(:attendance)
  end

  test "should_update_clockout_and_work_duration" do
  	clockin  = @attendance.clockin
  	@attendance.update_clock
  	work_dur = (@attendance.clockout - @attendance.clockin).to_i	
    
    #tests the updation of workDuration
    assert @attendance.work
    
    #tests the updation of clockout
    assert @attendance.clockout
    
    #tests work_duration calculation
    assert_equal work_dur, @attendance.work
  end

  test "should_set_clockin_time" do
    clockin = @attendance.clockin

    # tests clockin time set || not
    assert @attendance.clockin
  end

end
