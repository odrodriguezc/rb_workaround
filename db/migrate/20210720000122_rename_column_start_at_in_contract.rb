class RenameColumnStartAtInContract < ActiveRecord::Migration[6.1]
  def change
    rename_column :contracts, :start_at, :countdown_start_at
  end
end
