# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  date        :date
#  reminder    :date
#  calendar_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'
require 'date'

class EventTest < ActiveSupport::TestCase
  setup do
    u = User.new
    u.name = 'pepe'
    u.email = 'pepe'
    u.save
    @calendar = u.calendars.create!(name: 'pepe')
  end

  test 'should not save event without name' do
    c = @calendar.events.create(date: Date.new(2018, 12, 31))
    assert_not c.valid?
  end

  test 'should not save event without date' do
    c = @calendar.events.create(name: 'pepe')
    assert_not c.valid?
  end

  test 'should not save event without calendar' do
    e = Event.new
    e.date = Date.new(2018, 12, 31)
    assert_not e.valid?
  end

  test 'should save event with name and date' do
    assert = @calendar.events.create(name: 'pepe', date: Date.new(2018, 12, 31))
  end
end
