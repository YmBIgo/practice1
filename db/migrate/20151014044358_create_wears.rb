# 服のモデルを作る
class CreateWears < ActiveRecord::Migration
  def change
    create_table :wears do |t|

      t.timestamps      null: false

    end
  end
end
