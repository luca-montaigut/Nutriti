class User < ApplicationRecord
  after_update :get_age
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :recoverable, :rememberable, :validatable,
		 :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  after_create :welcome_mail

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name   # assuming the user model has a name
    end
  end

  def get_age
    if self.birthday
      (Time.now.year - self.birthday.year)
    else
      return 1
    end
  end

  def tmb
    if (self.gender == "Homme")
      ((13.707 * self.weight) + (492.3 * self.height / 100) - (6.673 * self.get_age) + 77.607) * self.physical_activity.to_f
    else
      ((9.740 * self.weight) + (492.3 * (self.height / 100)) - (6.673 * self.get_age) + 77.607) * self.physical_activity.to_f
    end
  end

  def welcome_mail
    UserMailer.welcome_email(self).deliver_now
  end

  def has_completed?
    (self.tmb == 0.0)? false : true
  end
end
