require 'test_helper'

class SalondoorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salondoors_index_url
    assert_response :success
  end

end
