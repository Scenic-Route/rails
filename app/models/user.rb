class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  before_save :ensure_authentication_token
  # after_create :send_creation_email



  has_one :profile, dependent: :destroy
  has_one :stat_tracker, dependent: :destroy
  has_many :routes
  has_many :ratings
  has_many :checkins

  # validations

  validates_presence_of :username
  validates_uniqueness_of :username


  def calculate_points
    @stats = self.stat_tracker
    @points = ((@stats.route_total * 5) + @stats.comment_total + (@stats.rating_total * 3) + (@stats.checkin_total * 2))
    self.profile.points = @points
    self.profile.save
    self.profile.calculate_level
  end



         # this is all omniauth bullshit, I'll deal with this later
  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.username = auth.info.nickname
  #   end
  # end

  # def self.new_with_session(params, session)
  #   if session["devise.user_attributes"]
  #     new(session["devise.user_attributes"], without_protection: true) do |user|
  #       user.attributes = params
  #       user.valid?
  #     end
  #   else
  #     super
  #   end
  # end

  # def password_required?
  #   super && provider.blank?
  # end

  # def update_with_password(params, *options)
  #   if encrypted_password.blank?
  #     update_attributes(params, *options)
  #   else
  #     super
  #   end
  # end


  def ensure_authentication_token
    if authentication_token.blank?
       self.authentication_token = generate_authentication_token
       self.save
    end
  end



  private
    # def send_creation_email
    #   ScenicRouteMailer.creation_email(self.email)
    # end

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
