class RenewContractJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Contract.where(countdown_start_at: ..1.months.ago).each do |contract|
      contract.update(countdown_start_at: DateTime.now)
    end
  end
end
