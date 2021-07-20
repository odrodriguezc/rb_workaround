module Countdownable
  extend ActiveSupport::Concern
  included do
    scope :older_than, ->(date = 1.month.ago) { where("countdown_start_at <= ?", date) }
  end
end