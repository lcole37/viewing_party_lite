require 'rails_helper'

describe 'As a user' do
  describe 'When I visit a movie detail page' do
    before(:each) do

      @user1 = User.create!(name: 'Mary', email: 'mary@gmail.com')
      @user2 = User.create!(name: 'Larry', email: 'larry@hotmail.com')
      @user3 = User.create!(name: 'Sherri', email: 'sherri@aol.com')

      movie_results = File.read('spec/fixtures/movie_results.json')
      # require "pry"; binding.pry
      stub_request(:get, "https://api.themoviedb.org/movie/top_rated").
           with(
             headers: {
                #errors here. api key still not loading after following error message
         	  'Api-Key'=>ENV["tmdb_api_key"]
             }).
           to_return(status: 200, body: "movie_results")
    end

    it "I should see A button to create viewing party" do
      visit "/users/#{@user1.id}/movies/955"

    end

    it "I should see a button to return to Discover Page" do

    end
  end

end
