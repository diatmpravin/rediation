require 'test_helper'

class UserControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  def test_registration_success
    
    post :register, :user => { :user_id =>"new_use_id",
                                        :email => "valid@example.com",
                                        :password =>"long_enough_password" }
                                        
     user = assigns(:user)

      assert_not_nill session[:user_id]
      assert_equal user.id, session[:user_id]  
    
  end
  
end
