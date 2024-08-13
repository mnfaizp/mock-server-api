# frozen_string_literal: true

#
class Session < ApplicationRecord
  # set primary key
  self.primary_key = "state"

  validates :redeem_code, presence: true
  validates :sequence, presence: true
  validates :state, presence: true, uniqueness: true
  validates :attendance_status, inclusion: { in: [ true, false ] }
end
