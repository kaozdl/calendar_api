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

class Calendar < ApplicationRecord
  has_many :events, dependent: :destroy
  belongs_to :user

  validates_presence_of :name
end
