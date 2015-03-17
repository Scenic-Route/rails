class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :route


  def is_profane?
    !Obscenity.profane?(self)
  end
end
