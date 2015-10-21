class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many    :wears
  belongs_to  :ward
  belongs_to  :station

  def full_profile?
    family_name? && first_name? && ward_id && station_id
  end

end
