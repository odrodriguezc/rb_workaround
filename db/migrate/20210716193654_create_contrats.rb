class CreateContrats < ActiveRecord::Migration[6.1]
  def change
    create_table :contrats do |t|
      t.datetime :start_at
      t.integer :renewed_every_as_days
      t.references :requestor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
