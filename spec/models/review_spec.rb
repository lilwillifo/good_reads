require 'rails_helper'

describe Review, type: :model do
  describe 'relationships' do
    it 'belongs to a user' do
      review = Review.create(body: 'absdfj', rating: 2)
      expect(review).to respond_to(:user)
    end
  end
  describe 'class methods' do
    it '.average_rating' do
      user = User.create!(name: 'Bob')
      review1 = Review.create!(body: 'absdfj', rating: 2, user_id: user.id)
      review2 = Review.create!(body: 'kjshdfa', rating: 4, user_id: user.id)
      expect(Review.average_rating).to eq(3)
    end
    it '.highest_rating' do
      user = User.create!(name: 'Bob')
      review1 = Review.create!(body: 'absdfj', rating: 2, user_id: user.id)
      review2 = Review.create!(body: 'kjshdfa', rating: 4, user_id: user.id)
      expect(Review.highest_rating).to eq(4)
    end
  end
end
