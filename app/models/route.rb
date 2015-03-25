class Route < ActiveRecord::Base

    # associations
  belongs_to :user
  has_many :favorites
  has_many :ratings
  has_many :checkins
  has_many :comments
  has_many :waypoints
  has_many :interest_points

  reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode


    # validations
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :end_lat
  validates_presence_of :end_long
  validates_presence_of :name
  validates_presence_of :user_id


  def create_waypoints(waypoints, route_id)
    waypoints.each do |waypoint|
      @waypoint = Waypoint.new(waypoint)
      @waypoint.route_id = route_id
      @waypoint.save
    end
    @waypoints = Waypoint.where(route_id: route_id).all
    @waypoints.order(:waypoint_order)
  end

    # dynamically calculates rankings for police, traffic, and quality
  def calculate_ratings
    ratings = Rating.where(route_id: self.id)
    num_of_ratings = ratings.count
    total_ratings = rating_totals(ratings)
    q_r = (total_ratings[0]/num_of_ratings.to_f)
    twist_r = (total_ratings[1]/num_of_ratings.to_f)
    t_r = (total_ratings[2]/num_of_ratings.to_f)
    s_r = (total_ratings[3]/num_of_ratings.to_f)
    self.quality_rating = q_r.round(2)
    self.twist_rating = twist_r.round(2)
    self.traffic_rating = t_r.round(2)
    self.scenery_rating = s_r.round(2)
    self.save
  end

    # used to help calculate ratings
  def rating_totals(ratings)
    total_quality = 0
    total_twist = 0
    total_traffic = 0
    total_scenic = 0
    ratings.each do |rating|
      total_quality += rating.quality_rating
      total_twist += rating.twist_rating
      total_traffic += rating.traffic_rating
      total_scenic += rating.scenery_rating
    end
    total_ratings = [total_quality, total_twist, total_traffic, total_scenic]
  end


    # adds to user's stat tracker when route is created
  def add_to_user_route_count(user)
    user.stat_tracker.route_total += 1
    user.stat_tracker.save
  end

    # subtracts from user's stat counter when route is created
  def subtract_from_user_route_count(user)
    user.stat_tracker.route_total -= 1
    user.stat_tracker.save
  end


  def add_to_popularity
    self.popularity += 1
    self.save
  end

  def subtract_from_popularity
    self.popularity -= 1
    self.save
  end


end
