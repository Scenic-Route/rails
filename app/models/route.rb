class Route < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite
  has_many :ratings


  def search(search_params)

  end

  def calculate_ratings

  end

  

end
