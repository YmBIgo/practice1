class AddPriceToWears < ActiveRecord::Migration
  def change
    change_table(:wears) do |t|
      t.integer       :price,       default: 0
      t.boolean       :rent_or_not, default: false, null: false
    end
  end
end
