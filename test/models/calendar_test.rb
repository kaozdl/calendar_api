# frozen_string_literal: true

# == Schema Information
#
# Table name: calendars
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CalendarTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(name: 'pepe', email: 'pepe')
  end

  test 'should not save calendar without a name' do
    c = @user.calendars.create(name: nil)
    assert_not c.valid?
  end

  test 'should not save calendar without a user' do
    c = Calendar.new(name: 'pepe')
    assert_not c.valid?
  end

  test 'should save calendar with name and user' do
    c = @user.calendars.create(name: 'pepe')
    assert c.valid?
  end
end
