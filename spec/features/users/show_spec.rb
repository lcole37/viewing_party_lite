require 'rails_helper'

RSpec.describe 'The User show page' do
  describe 'As an admin' do
    describe 'When I visit the Landing page' do
      before(:each) do
        @user1 = User.create!(name: 'Mary', email: 'mary@gmail.com', password: 'password123', password_confirmation: 'password123')
        @user2 = User.create!(name: 'Larry', email: 'larry@hotmail.com', password: 'password123', password_confirmation: 'password123')
        @user3 = User.create!(name: 'Sherri', email: 'sherri@aol.com', password: 'password123', password_confirmation: 'password123')

        visit "/"

        click_link "Log In"

        fill_in :email, with:'mary@gmail.com'
        fill_in :password, with: 'password123'
        click_button 'Log In'
      end

      it 'shows the users name at the top of the page' do
        expect(page).to have_content("Mary's Dashboard")
        expect(page).not_to have_content("Sherri's Dashboard")
        expect(page).not_to have_content("Larry's Dashboard")

        # robust tests skipped due to auth requirements per user
        # visit user_path(@user2)
        #
        # expect(page).to have_content("Larry's Dashboard")
        # expect(page).not_to have_content("Mary's Dashboard")
        # expect(page).not_to have_content("Sherri's Dashboard")
        #
        # visit user_path(@user3)
        #
        # expect(page).to have_content("Sherri's Dashboard")
        # expect(page).not_to have_content("Larry's Dashboard")
        # expect(page).not_to have_content("Mary's Dashboard")
      end

      it 'I should see a button to Discover Movies' do
        expect(page).to have_button "Discover Movies"

        click_button "Discover Movies"

        expect(current_path).to eq(user_discover_index_path(@user1))
      end

      it 'I see a section that lists all viewing parties' do
        expect(page).to have_content("Existing Viewing Parties")
      end
    end
  end
end
