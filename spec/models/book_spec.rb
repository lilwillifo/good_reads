require 'rails_helper'

describe Book, type: :model do
  describe 'relationships' do
    it 'has many reviews' do
      book = Book.create(title: 'absdfj')
      expect(book).to respond_to(:reviews)
    end
  end
  describe 'instance methods' do
    it '.average_review' do
      book = Book.create!(title: 'Murder on the Orient Express')
      user_1 = User.create!(name: 'Margaret')
      user_2 = User.create!(name: 'Ali')
      review_1 = book.reviews.create!(body: 'great read!', user_id: user_1.id, rating: 5)
      review_2 = book.reviews.create!(body: 'meh', user_id: user_2.id, rating: 3)

      expect(book.average_review).to eq(4)
    end
  end
end
