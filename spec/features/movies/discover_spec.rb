require 'rails_helper'

RSpec.describe 'discover movies page' do
  describe 'happy path' do
    it 'allows users to view top rated movies' do
      VCR.use_cassette('moviedb_movies_5', re_record_interval: 7.days) do
        user = User.create!(name: "Snoopy", email: "snoopy@peanuts.com")

        visit "/users/#{user.id}/discover"

        click_button 'Find Top Rated Movies'

        expect(page.status_code).to eq 200
        expect(page).to have_content("The Godfather")
        expect(page).to have_content("Parasite")
        expect(page).to_not have_content("Dumb and Dumber")
      end
    end

    it 'allows users to search for movies by keyword' do
      VCR.use_cassette('moviedb_movies_6', re_record_interval: 7.days) do
        user = User.create!(name: "Snoopy", email: "snoopy@peanuts.com")

        visit "/users/#{user.id}/discover"

        fill_in :movie_title, with: 'school'
        click_button 'Find Movies'

        expect(page.status_code).to eq 200
        expect(page).to have_content("High School Musical")
        expect(page).to have_content("School of Rock")
        expect(page).to_not have_content("Harry Potter and the Goblet of Fire")
      end
    end
  end
end