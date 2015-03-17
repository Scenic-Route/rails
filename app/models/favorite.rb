class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :route


  validates :user_id, presence: true
  validates :route_id, presence: true
  validates :favorite_name, presence: true



end