# frozen_string_literal: true

class Place < ApplicationRecord
#   belongs_to :user

  belongs_to :share

  has_many :groups
  has_many :users, through: :groups
end
