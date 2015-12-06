class User < ActiveRecord::Base
  has_secure_password

  has_many :compliments
  belongs_to :partner, class_name: "User", dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
