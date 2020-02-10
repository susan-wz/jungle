class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, { presence: true, length: { minimum: 6 } }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    User.find_by(email: email.strip).try(:authenticate, password)
  end
  
end
