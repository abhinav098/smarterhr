require 'test_helper'

class LeaveTest < ActiveSupport::TestCase

  should belong_to :user
  should validate_inclusion_of(:status).in_array(%w[open approved rejected cancelled])
  should validate_presence_of(:message)
  should validate_presence_of(:message)
  should validate_presence_of(:from_date)
  should validate_presence_of(:to_date)


  def setup 
  	@leave = create(:leave)
  end


  test "should test default status" do
		assert_equal @leave.status, 'open'
	end

 	test "should_tell_from_date" do
 		assert_equal @leave.from , @leave.from_date.strftime("%d-%m-%Y")
  end

  test "should_tell_to_date" do
 		assert_equal @leave.to , @leave.to_date.strftime("%d-%m-%Y")
  end

 	test "should_tell_no_of_days" do
		assert_equal @leave.days ,(DateTime.parse(@leave.to).mjd - DateTime.parse(@leave.from).mjd) + 1
	 end

  test "should approve the leave" do
		assert @leave.approve
		assert_equal @leave.status, 'approved'
	end

  test "should reject the leave" do
		assert @leave.reject
		assert_equal @leave.status, 'rejected'
	end
  test "should cancel the leave" do
		assert @leave.cancel
		assert_equal @leave.status, 'cancelled'
	end
end