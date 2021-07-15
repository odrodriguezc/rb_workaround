class CreateRequestors < ActiveRecord::Migration[6.1]
  def change
    create_table :requestors do |t|
      t.string :name
      t.string :email
      t.string :phoneNumber
      t.text :biography

      t.timestamps
    end
  end
end
