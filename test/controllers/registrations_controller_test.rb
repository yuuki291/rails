require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get registration" do
    get registrations_registration_url
    assert_response :success
  end

end
