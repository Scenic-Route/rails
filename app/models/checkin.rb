class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :route


    # validations

  validates_presence_of :user_id
  validates_presence_of :route_id
  validates_presence_of :latitude
  validates_presence_of :longitude

    def add_to_user_checkin_count(user)
      user.stat_tracker.checkin_total += 1
      user.stat_tracker.save
    end


    def within_checkin_distance(route, coordinates)
      if Geocoder::Calculations.distance_between(route, coordinates) <= 1
        true
      else
        false
      end
    end
end