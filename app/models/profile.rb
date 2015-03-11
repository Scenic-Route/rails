class Profile < ActiveRecord::Base

    # Paperclip validations and information
  has_attached_file :vehicle_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :vehicle_photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :vehicle_photo, :matches => [/png\Z/, /jpe?g\Z/]
  validates_with AttachmentSizeValidator, :attributes => :vehicle_photo, :less_than => 1.megabytes
  
    # Associations
  belongs_to :user

end
