class Contract < ApplicationRecord
  belongs_to :requestor

  scope :older_than, ->(date = 1.month.ago) { where("countdown_start_at <= ?", date) }
end
