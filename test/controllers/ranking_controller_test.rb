require 'test_helper'

class RankingControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get ranking_show_url
    assert_response :success
  end

end
