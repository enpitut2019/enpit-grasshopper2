require 'test_helper'

class RecordControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get record_show_url
    assert_response :success
  end

end
