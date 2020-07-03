class User < ApplicationRecord
  
  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  # has_many :places

  has_many :groups
  has_many :places, through: :groups


  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
  end
end
