class Profile < ActiveRecord::Base

    # Paperclip validations and information
  has_attached_file :vehicle_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => {
                            :bucket => ENV["S3_BUCKET"],
                            :access_key_id => ENV["S3_ACCESS_KEY"],
                            :secret_access_key => ENV["S3_SECRET_KEY"]
                    }

  validates_attachment_content_type :vehicle_photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :vehicle_photo, :matches => [/png\Z/, /jpe?g\Z/]
  validates_with AttachmentSizeValidator, :attributes => :vehicle_photo, :less_than => 2.megabytes
  
    # Associations
  belongs_to :user






  private





      
end
