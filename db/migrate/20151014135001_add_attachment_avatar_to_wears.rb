class AddAttachmentAvatarToWears < ActiveRecord::Migration
  def self.up
    change_table :wears do |t|
      t.attachment :avatar
      t.integer    :user_id
    end
  end

  def self.down
    remove_attachment :wears, :avatar
  end
end
