require 'rails_helper'

describe 'As a user' do
  context 'I visit a book show page' do
    it 'and see the book title' do
      book = Book.create!(title: 'The Giver')

      visit book_path(book)

      expect(page).to have_content(book.title)
    end
    it 'and all its reviews, including the body, author, and rating' do
      book = Book.create!(title: 'Murder on the Orient Express')
      other_book = Book.create!(title: 'Harry Potter')
      user_1 = User.create!(name: 'Margaret')
      user_2 = User.create!(name: 'Ali')
      review_1 = book.reviews.create!(body: 'great read!', user_id: user_1.id, rating: 5)
      review_2 = book.reviews.create!(body: 'meh', user_id: user_2.id, rating: 3)
      review_3 = other_book.reviews.create!(body: 'wizards!', user_id: user_1.id, rating: 4)

      visit book_path(book)

      expect(page).to have_content(review_1.body)
      expect(page).to have_content(review_1.rating)
      expect(page).to have_content(user_1.name)
      expect(page).to have_content(review_2.body)
      expect(page).to have_content(review_2.rating)
      expect(page).to have_content(user_2.name)
      expect(page).to_not have_content(review_3.body)
    end
    it 'and I see the average rating for that book' do
      book = Book.create!(title: 'Murder on the Orient Express')
      user_1 = User.create!(name: 'Margaret')
      user_2 = User.create!(name: 'Ali')
      review_1 = book.reviews.create!(body: 'great read!', user_id: user_1.id, rating: 5)
      review_2 = book.reviews.create!(body: 'meh', user_id: user_2.id, rating: 3)

      visit book_path(book)

      expect(page).to have_content('Average Rating: 4')
    end
    it 'and I see a header with the highest rating of the book' do
      book = Book.create!(title: 'Murder on the Orient Express')
      user_1 = User.create!(name: 'Margaret')
      user_2 = User.create!(name: 'Ali')
      review_1 = book.reviews.create!(body: 'great read!', user_id: user_1.id, rating: 5)
      review_2 = book.reviews.create!(body: 'meh', user_id: user_2.id, rating: 3)

      visit book_path(book)

      within ".high" do
        expect(page).to have_content('Highest Rating: 5')
        expect(page).to have_content(user_1.name)
        expect(page).to have_content(review_1.body)
      end
    end
    it 'and I see a header with the lowest rating of the book' do
      book = Book.create!(title: 'Murder on the Orient Express')
      user_1 = User.create!(name: 'Margaret')
      user_2 = User.create!(name: 'Ali')
      review_1 = book.reviews.create!(body: 'great read!', user_id: user_1.id, rating: 5)
      review_2 = book.reviews.create!(body: 'meh', user_id: user_2.id, rating: 3)

      visit book_path(book)

      within ".low" do
        expect(page).to have_content('Lowest Rating: 3')
      end
    end
  end
end
