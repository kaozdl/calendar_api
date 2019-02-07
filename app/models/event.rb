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

class Event < ApplicationRecord
  belongs_to :calendar

  validates_presence_of :name, :date
end
