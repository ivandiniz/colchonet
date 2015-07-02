class User < ActiveRecord::Base
  EMAIL_REGEXXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, minimum: 5, allow_blank: false
  validates_format_of :email, with: EMAIL_REGEXXP

  has_secure_password
  
  before_create do |user|
    user.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirmed?
    confirmed_at.present?
  end

end
