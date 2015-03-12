class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :route


  def add_to_user_rating_count(user)
    user.stat_tracker.rating_total += 1
    user.save
  end

  def subtract_from_user_rating_count(user)
    user.stat_tracker.rating_total -= 1
    user.save
  end

end
