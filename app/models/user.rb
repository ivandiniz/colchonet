class User < ActiveRecord::Base
  EMAIL_REGEXXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, minimum: 30, allow_blank: false
  validates_format_of :email, with: EMAIL_REGEXXP

  has_secure_password

end
