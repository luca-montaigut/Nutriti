class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def tmb
    if (self.gender == "homme")
       ((13.707 * self.weight) + (492.3 * self.height / 100) - (6.673 * self.age) + 77.607) * self.physical_activity.to_f
    else
     ((9.740 * self.weight) + (492.3 * (self.height / 100)) - (6.673 * self.age) + 77.607) * self.physical_activity.to_f
    end
  end
end
