class StatTracker < ActiveRecord::Base
  belongs_to :user

  before_update :calculate_points_and_level



  private

  def calculate_points_and_level
    @user = self.user
    self.points = ((self.route_total * 5) + self.comment_total + (self.rating_total * 3) + (self.checkin_total * 2))
    @user.profile.level = calculate_level(self.points)
    @user.profile.save
  end

  def calculate_level(points)
    if points < 35
      'Bronze'
    elsif points >= 35 && points < 100 
      'Silver'
    elsif points >= 100 && points < 175
      'Gold'
    else
      'Platinum'
    end
  end
end
