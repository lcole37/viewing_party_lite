require 'rails_helper'

RSpec.describe 'The Movies Show Page' do
  describe 'As a Visitor' do
    describe 'When I visit the Movies Show Page' do
      before(:each) do
        @user1 = User.create!(name: 'Mary', email: 'mary@gmail.com', password: 'password123', password_confirmation: 'password123')

        visit user_movie_path(@user1, 515001)
      end

      it "displays a button to 'Create a Viewing Party'" do
        expect(page).to have_button('Create Viewing Party')

        click_button('Create Viewing Party')

        expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, 515001))
      end

      it "displays a button to return to the 'Discover Movies' page" do
        expect(page).to have_button('Discover Page')

        click_button('Discover Page')

        expect(current_path).to eq(user_discover_index_path(@user1))
      end
    end
  end

  describe 'As a Registered User' do
    describe 'When I visit the Movies Show Page' do
      before(:each) do
        @user1 = User.create(name: 'User One', email: 'email@example.com', password: 'password123')

        visit "/"

        click_link "Log In"

        fill_in :email, with:'email@example.com'
        fill_in :password, with: 'password123'
        click_button 'Log In'

        visit user_movie_path(@user1, 515001)
      end

      it "displays a button to 'Create a Viewing Party'" do
        expect(page).to have_button('Create Viewing Party')

        click_button('Create Viewing Party')

        expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, 515001))
      end

      it "displays a button to return to the 'Discover Movies' page" do
        expect(page).to have_button('Discover Page')

        click_button('Discover Page')

        expect(current_path).to eq(user_discover_index_path(@user1))
      end
    end
  end
end
