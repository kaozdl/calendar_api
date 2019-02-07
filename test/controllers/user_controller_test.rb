# frozen_string_literal: true

require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  # ================= create ==================== #
  test 'should not create empty user' do
    post '/user', params: {
      name: nil,
      email: nil
    }
    assert_response :unprocessable_entity
  end

  test 'should not create user without name' do
    post '/user', params: {
      name: nil,
      email: 'pepe@pepe.com'
    }
    assert_response :unprocessable_entity
  end

  test 'should not create user without email' do
    post '/user', params: {
      name: 'pepe',
      email: nil
    }
    assert_response :unprocessable_entity
  end

  test 'valid user creation' do
    u = post '/user', params: {
      name: 'pepe',
      email: 'pepe@pepe.com'
    }
    assert_response :created
  end

  # ==================== show ======================= #
  test 'show non existent user' do
    get '/user/90238410923810'
    assert_response :not_found
  end

  test 'show existent user' do
    post '/user', params: {
      name: 'pepe',
      email: 'pepe@pepe.com'
    }
    get '/user', params: { id: 1 }
    assert_response :ok
  end
end
