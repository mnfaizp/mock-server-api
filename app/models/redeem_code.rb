# frozen_string_literal: true

class RedeemCode < ApplicationRecord
  # set primary key
  self.primary_key = "code"

  validates :code, presence: true, uniqueness: true
  validates :state, presence: true, uniqueness: true
  validates :start_redeem_at, presence: true
  validates :end_redeem_at, presence: true
  validates :status, inclusion: { in: [ true, false ] }
end
