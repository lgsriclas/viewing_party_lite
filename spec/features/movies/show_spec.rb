require 'rails_helper'

RSpec.describe 'movie show page' do
  describe 'happy path' do
    it 'shows data for a searched movie' do
      VCR.use_cassette('moviedb_movies', re_record_interval: 7.days) do
        visit '/users/1/discover'

        fill_in :movie_title, with: 'harry'
        click_button 'Find Movies'

        expect(page.status_code).to eq 200
        expect(page).to have_content("Harry Potter and the Chamber of Secrets")
        expect(page).to have_content("When Harry Met Sally")
        expect(page).to_not have_content("Big Fish")
      end
    end
  end
end