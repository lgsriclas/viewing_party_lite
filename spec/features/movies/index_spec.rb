require 'rails_helper'

RSpec.describe 'movie show page' do
  describe 'happy path' do
    it 'shows movie data' do
      VCR.use_cassette('moviedb_movies', re_record_interval: 7.days) do
        user = User.create!(name: "Snoopy", email: "snoopy@peanuts.com")

        visit "/users/#{user.id}/discover"

        fill_in :movie_title, with: 'harry'
        click_button 'Find Movies'

        expect(page.status_code).to eq 200
        expect(page).to have_content("Harry Potter and the Chamber of Secrets")
        expect(page).to have_content("When Harry Met Sally")
      end
    end
  end

  describe 'sad path' do
    it 'does not show movie data' do
      VCR.use_cassette('moviedb_movies', re_record_interval: 7.days) do
        user = User.create!(name: "Snoopy", email: "snoopy@peanuts.com")

        visit "/users/#{user.id}/discover"

        click_button 'Find Movies'

        expect(page.status_code).to eq 400
      end
    end
  end
end