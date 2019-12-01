require 'test_helper'

class StartpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get startpages_index_url
    assert_response :success
  end

end
