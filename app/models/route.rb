class Route < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite
  has_many :ratings


    # here come the validations! There's going to a lot of these...
  validates :start_lat, presence: true
  validates :start_long, presence: true
  validates :end_lat, presence: true

  def search(search_params)

  end

  def calculate_ratings

  end

  def add_to_user_route_count(user)
    user.stat_tracker.route_count += 1
    user.save
  end

  def subtract_from_user_route_count(user)
    user.stat_tracker.route_count -= 1
    user.save
  end


end
