class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable,
         :omniauthable, omniauth_providers: %i[discord]

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.username = auth.info["name"]
    user.save!
    user
  end

  # This method is used to skip the email validation for omniauth users
  def email_required?
    false
  end

  # This method is used to skip the password validation for omniauth users
  def encrypted_password
    false
  end
end
