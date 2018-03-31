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

      expect(book.average_rating).to eq(4)
    end
    it '.highest_rating' do
      book = Book.create!(title: 'Murder on the Orient Express')
      user_1 = User.create!(name: 'Margaret')
      user_2 = User.create!(name: 'Ali')
      review_1 = book.reviews.create!(body: 'great read!', user_id: user_1.id, rating: 5)
      review_2 = book.reviews.create!(body: 'meh', user_id: user_2.id, rating: 3)

      expect(book.highest_rating).to eq(5)
    end
    it '.lowest_rating' do
      book = Book.create!(title: 'Murder on the Orient Express')
      user_1 = User.create!(name: 'Margaret')
      user_2 = User.create!(name: 'Ali')
      review_1 = book.reviews.create!(body: 'great read!', user_id: user_1.id, rating: 5)
      review_2 = book.reviews.create!(body: 'meh', user_id: user_2.id, rating: 3)

      expect(book.lowest_rating).to eq(3)
    end
    it '.highest_review' do
      book = Book.create!(title: 'Murder on the Orient Express')
      user_1 = User.create!(name: 'Margaret')
      user_2 = User.create!(name: 'Ali')
      review_1 = book.reviews.create!(body: 'great read!', user_id: user_1.id, rating: 5)
      review_2 = book.reviews.create!(body: 'meh', user_id: user_2.id, rating: 3)

      expect(book.highest_review).to eq(review_1)
    end
  end
end
