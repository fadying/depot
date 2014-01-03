require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    ouyang = users(:one)
    post :create, name: ouyang.name, password: '123456'
    assert_redirected_to admin_url
    assert_equal ouyang.id, session[:user_id]
  end

  test "should fail login" do
    ouyang = users(:one)
    post :create, name: ouyang.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
  end

end
