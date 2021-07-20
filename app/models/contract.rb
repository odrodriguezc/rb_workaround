class Contract < ApplicationRecord
  include Countdownable

  belongs_to :requestor
end
