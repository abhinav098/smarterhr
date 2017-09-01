ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'database_cleaner'
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with(:truncation)
# Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
module ActiveSupport
	class TestCase
	  include FactoryGirl::Syntax::Methods

	  def setup
	    DatabaseCleaner.start
	  end

	  def teardown
	    DatabaseCleaner.clean
	  end
	end
end

module ActionController
	class TestCase
	  include Devise::Test::ControllerHelpers

	  def setup
	    DatabaseCleaner.start
	  end

	  def teardown
	    DatabaseCleaner.clean
	  end
	end
end 
