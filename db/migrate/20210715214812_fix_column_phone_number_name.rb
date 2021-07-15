class FixColumnPhoneNumberName < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :requestors, :phoneNumber, :phone_number
  end

  def self.down
    rename_column :requestors, :phone_number, :phoneNumber
  end
end
