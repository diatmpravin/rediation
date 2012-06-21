require 'test_helper'

class StartControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  def test_index
    get :index
    title = assigns(:controller.action_name)
    assert_equal "Welcome to : index", title
    assert_response :success
    assert_template "index"
  end
  
end
