class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :route



    def add_to_user_checkin_count(user)
      user.stat_tracker.checkin_total += 1
      user.stat_tracker.save
    end

end