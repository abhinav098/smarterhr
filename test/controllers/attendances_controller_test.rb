require 'test_helper'

class AttendancesControllerTest < ActionController::TestCase

	def setup 
		@user = create(:user)
	end

  test "should redirect index if not logged in" do
    get :index
   	assert_redirected_to new_user_session_path	
  end

  test "should get index after sign_in" do
    sign_in @user
    get :index
    assert_response :success
  end


	test "should create attendance" do
	  assert_difference('Attendance.count') do
	  	get :index
    	sign_in @user
    	request.env["HTTP_REFERER"] = root_path
    	post :create
  		assert_redirected_to '/'
	  end
	end

	test "should update article" do
		sign_in @user
	  attendance = create(:attendance)
    request.env["HTTP_REFERER"] = root_path
	  patch :update, {id: attendance.id}
	  assert_redirected_to '/'
	end

end
