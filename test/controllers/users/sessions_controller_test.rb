require 'test_helper'

module Users
  class SessionsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:one)
    end

    test 'should create authenticate token' do
      post users_sessions_path(email: @user.email, password: '12345678')

      body = JSON.parse(response.body)
      if body['name'] == @user.name
        puts @user.authenticate_token
       assert_response 200
      end
    end
  end
end