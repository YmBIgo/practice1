class AddBrandIdToWears < ActiveRecord::Migration
  def change
    add_column :wears,    :brand_id,    :integer
  end
end
