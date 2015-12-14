class User < ActiveRecord::Base
  has_secure_password

  has_many :compliments
  belongs_to :partner, class_name: "User", dependent: :destroy
  before_create :generate_api_key!
  validates :api_key, uniqueness: true
  validates :username, :first_name, :last_name, :api_key, presence: true

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  private

  def generate_api_key!
    self.api_key = "#{first_name}:#{rand(10 ** 10)}" unless api_key
  end
end
