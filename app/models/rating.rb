class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :route

    # validations
  validates_uniqueness_of :user_id, scope: :route_id
  validates_presence_of :user_id
  validates_presence_of :route_id
  validates_presence_of :twist_rating
  validates_presence_of :quality_rating
  validates_presence_of :traffic_rating
  


  def add_to_user_rating_count(user)
    user.stat_tracker.rating_total += 1
    user.save
  end

  def subtract_from_user_rating_count(user)
    user.stat_tracker.rating_total -= 1
    user.save
  end

end
