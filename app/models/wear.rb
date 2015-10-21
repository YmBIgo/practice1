class Wear < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :brand

  has_attached_file :avatar, styles: { medium: "300*300>", thumb: "100*100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]

  validates_presence_of :price,:avatar
end
