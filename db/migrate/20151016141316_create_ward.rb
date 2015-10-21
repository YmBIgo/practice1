class CreateWard < ActiveRecord::Migration
  def change
    create_table :wards do |t|
      t.string        :name
    end
  end
end
