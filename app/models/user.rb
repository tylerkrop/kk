class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable,
         :omniauthable, omniauth_providers: %i[discord]

  validates :provider, presence: true
  validates :uid, presence: true
  validates :username, presence: true

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.username = auth.info["name"]
    user.save!
    user
  end

  # Skip the email validation for Devise
  def email_required?
    false
  end

  # Skip password validation for Devise
  def encrypted_password
    false
  end

  # Force the remember token to always be present for Devise
  def remember_me
    true
  end
end
