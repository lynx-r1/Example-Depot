require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  fixtures :users

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "index without user" do
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Please log in", flash[:notice]
  end

  test "index with user" do
    get :index, {}, { :user_id => users(:lynx).id }
    assert_response :success
    assert_template "index"
  end

  test "login" do
    lynx = users(:lynx)
    post :login, :name =>lynx.name, :password => 'secret'
    assert_redirected_to :action => "index"
    assert_equal lynx.id, session[:user_id]
  end

  test "bad password" do
    lynx = users(:lynx)
    post :login, :name => lynx.name, :password => 'wrong'
    assert_template "login"
  end
end
