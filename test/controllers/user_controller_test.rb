require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test 'should get User given username' do
    test_user = users(:testUser)
    get url_for(controller: 'user', action: 'show', username: test_user.username)
    assert_response :success
  end

  test 'should create user given username and password' do
    post url_for(controller: 'user', action: 'create', username: 'testing', password: '1234567890',
                 password_confirmation: '1234567890')
    assert_response :success
  end
end
