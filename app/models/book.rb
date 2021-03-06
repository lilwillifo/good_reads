class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    self.reviews.average_rating
  end

  def highest_rating
    self.reviews.highest_rating
  end

  def lowest_rating
    self.reviews.lowest_rating
  end

  def highest_review
    self.reviews.find_by(rating: self.highest_rating)
  end
end
