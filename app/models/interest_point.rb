class InterestPoint < ActiveRecord::Base

  belongs_to :route
  belongs_to :user

    # validations

  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :route_id



end