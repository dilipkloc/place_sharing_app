# frozen_string_literal: true

class Place < ApplicationRecord
#   belongs_to :user

  has_many :groups
  has_many :users, through: :groups
end
