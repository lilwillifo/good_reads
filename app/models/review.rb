class Review < ApplicationRecord
  belongs_to :user

  def self.average_rating
    average(:rating)
  end

  def self.highest_rating
    maximum(:rating)
  end
end
