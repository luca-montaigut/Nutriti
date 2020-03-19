class User < ApplicationRecord
  before_create :user_week
  after_update :get_age
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :recoverable, :rememberable, :validatable,
		 :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :welcome_mail

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        self.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	  self.email = auth.raw_info.email
      self.password = Devise.friendly_token[0,20]
      self.first_name = auth.raw_info.name
    end
  end

  def get_age
    if self.birthdate
      (Time.now.year - self.birthdate.year)
    else
      return 0
    end
  end

  def mb
    if self.gender == "Homme"
      ((13.707 * self.weight) + (492.3 * (self.height / 100.00).to_d) - (6.673 * self.get_age) + 77.607).to_d
    elsif self.gender == "Femme"
      ((9.740 * self.weight) + (172.9 * (self.height / 100.00).to_d) - (4.737 * self.get_age) + 667.051).to_d
    else
      return 0.0
    end
  end

  def drc
    if (self.gender == "Homme")
      self.mb * self.physical_activity.to_d
    else
      self.mb * self.physical_activity.to_d
    end
  end

  def welcome_mail
    UserMailer.welcome_email(self).deliver_now
  end

  def incomplete_profile?
    self.drc == 0.0
  end

  def breakfast
    (self.drc / 100) * 25
  end

  def lunch
    (self.drc / 100) * 45
  end

  def dinner
    (self.drc / 100) * 30
  end
  
  private
  
  def user_week
    Week.create(user_id: self.id)    
  end
  
end