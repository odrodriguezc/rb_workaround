require 'sidekiq-scheduler'

class RenewContractJob
  include Sidekiq::Worker

  def perform(*args)
    logger.info('test renew contract')
=begin
    Contract.older_than.each do |contract|
      contract.update(countdown_start_at: DateTime.now)
    end
=end
  end
end
