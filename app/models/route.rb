class Route < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite
  has_many :ratings


    # here come the validations! There's going to a lot of these...
  validates :start_lat, presence: true
  validates :start_long, presence: true
  validates :end_lat, presence: true

  def search_by_distance(search_params)
    search_radius = search_params[:search_radius].to_i
    current_location = [search_params[:current_lat], search_params[:current_long]]

  end

  def calculate_ratings
    ratings = Rating.where(route_id: self.id)
    num_of_ratings = ratings.count
    total_ratings = rating_totals(ratings)
    q_r = (total_ratings[0]/num_of_ratings.to_f)
    p_r = (total_ratings[1]/num_of_ratings.to_f)
    t_r = (total_ratings[2]/num_of_ratings.to_f)
    self.quality_rating = q_r.round(2)
    self.police_rating = p_r.round(2)
    self.traffic_rating = t_r.round(2)
    self.save
  end

  def rating_totals(ratings)
    total_quality = 0
    total_police = 0
    total_traffic = 0
    ratings.each do |rating|
      total_quality += rating.quality_rating
      total_police += rating.police_rating
      total_traffic += rating.traffic_rating
    end
    total_ratings = [total_quality, total_police, total_traffic]
  end

  def add_to_user_route_count(user)
    user.stat_tracker.route_total -= 1
    user.stat_tracker.save
  end

  def subtract_from_user_route_count(user)
    user.stat_tracker.route_total -= 1
    user.stat_tracker.save
  end


end
