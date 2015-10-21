class AddWardIdToUser < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.integer     :ward_id
      t.integer     :station_id
    end
  end
end
