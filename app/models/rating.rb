class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :route

  validates_uniqueness_of :user_id, scope: :route_id


  def add_to_user_rating_count(user)
    user.stat_tracker.rating_total += 1
    user.save
  end

  def subtract_from_user_rating_count(user)
    user.stat_tracker.rating_total -= 1
    user.save
  end

end
