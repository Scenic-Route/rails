class Waypoint < ActiveRecord::Base

  belongs_to :route

  

  validates_presence_of :route_id
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :comment
  validates_presence_of :waypoint_order

end