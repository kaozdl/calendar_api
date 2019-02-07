# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without email' do
    user = User.new
    user.name = 'pepe'
    assert_not user.save
  end

  test 'should not save user without name' do
    user = User.new
    user.email = 'pepe'
    assert_not user.save
  end

  test 'should save user with name and email' do
    user = User.new
    user.email = 'pepe'
    user.name = 'pepe'
    assert user.save
  end
end
