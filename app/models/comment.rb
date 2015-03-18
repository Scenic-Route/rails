class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :route

  validates_presence_of :user_id
  validates_presence_of :route_id
  validates_presence_of :content

  def is_profane?
    !Obscenity.profane?(self)
  end
end
