require 'rails_helper'

describe Book, type: :model do
  describe 'relationships' do
    it 'has many reviews' do
      book = Book.create(title: 'absdfj')
      expect(book).to respond_to(:reviews)
    end
  end
end
