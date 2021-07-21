require 'sidekiq-scheduler'

class RenewContractJob
  include Sidekiq::Worker

  def perform(*args)
    Contract.older_than.each do |contract|
      contract.update(countdown_start_at: DateTime.now)
      RequestorMailer.with(contract: contract).renew_contract_email.deliver_now
    end
  end
end
