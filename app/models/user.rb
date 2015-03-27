class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  before_save :ensure_authentication_token
  # after_create :send_creation_email


  # associations

  has_one :identity
  has_one :profile, dependent: :destroy
  has_one :stat_tracker, dependent: :destroy
  has_many :routes
  has_many :ratings
  has_many :checkins
  has_many :favorites
  has_many :comments
  has_many :interest_points

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
         
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end
  end

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
