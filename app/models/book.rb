class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    self.reviews.average_rating
  end

  def highest_rating
    self.reviews.highest_rating
  end
end
