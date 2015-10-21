class AddWardIdToStations < ActiveRecord::Migration
  def change
    add_column :stations, :ward_id, :integer
  end
end
