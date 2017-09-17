require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test 'should get User given username' do
    test_user = users(:testUser)
    get url_for(controller: 'user', action: 'show', username: test_user.username)
    assert_response :success
  end

  test 'should create user given username and password' do
    post url_for(controller: 'user', action: 'create'), params: { username: 'testing', password: '1234567890',
                                                                  password_confirmation: '1234567890' }
    assert_response :success
  end

  test 'should not create user given a user with an invalid password' do
    post url_for(controller: 'user', action: 'create'), params: { username: 'testing', password: '12345',
                                                                  password_confirmation: '12345' }
    assert_response :bad_request
  end
end
