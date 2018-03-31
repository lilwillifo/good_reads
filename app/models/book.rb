class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    self.reviews.average_rating
  end
end
