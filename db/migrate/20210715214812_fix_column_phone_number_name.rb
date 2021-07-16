class FixColumnPhoneNumberName < ActiveRecord::Migration[6.1]
  def change
    rename_column :requestors, :phoneNumber, :phone_number
  end
end
