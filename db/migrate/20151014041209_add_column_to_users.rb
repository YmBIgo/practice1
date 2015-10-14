class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users,    :family_name,       :string
    add_column :users,    :first_name,        :string
    add_column :users,    :family_name_kane,  :string
    add_column :users,    :first_name_kana,   :string
  end
end
