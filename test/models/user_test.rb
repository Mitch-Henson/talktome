require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User creation fails as no password is provided' do
    assert_not(User.new(username: 'hans').save, 'user created when no password provided')
  end

  test 'User creation fails as the password provided is too short' do
    assert_not(User.new(username: 'hans', password: 'hans1').save,'password is too short')
  end

  test 'User creation succeeds as the password meets criteria' do
    assert(User.new(username: 'hans', password: 'h4n5@7$@[^f').save, 'user not created')
  end

  test 'User creation fails because password confirmation does not match' do
    assert_not(User.new(username: 'hans', password: 'h4n5@7$@[^f', password_confirmation: 'incorrect').save,
               'password confirmation does not match')
  end

  test 'User creation succeeds as the password confirmation matches the password' do
    assert(User.new(username: 'hans', password: 'h4n5@7$@[^f', password_confirmation: 'h4n5@7$@[^f').save,
               'password confirmation matches')
  end
end
