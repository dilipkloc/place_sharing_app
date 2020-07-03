class User < ApplicationRecord
  extend FriendlyId
  attr_accessor :login

  friendly_id :username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :places, through: :groups

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ['lower(username) = :value OR lower(email) = :value',
       { value: login.strip.downcase }]
    ).first
  end
end
