require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #validation test
  should have_many(:attendances)
  	
end
