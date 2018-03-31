require 'rails_helper'

describe Review, type: :model do
  describe 'relationships' do
    it 'belongs to a user' do
      review = Review.create(body: 'absdfj', rating: 2)
      expect(review).to respond_to(:user)
    end
  end
end
