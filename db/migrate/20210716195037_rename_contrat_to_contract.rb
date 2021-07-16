class RenameContratToContract < ActiveRecord::Migration[6.1]
  def change
    rename_table :contrats, :contracts
  end
end
