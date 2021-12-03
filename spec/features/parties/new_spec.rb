require 'rails_helper'

RSpec.describe 'create viewing party' do
  describe 'happy path' do
    it 'allows user to create a viewing party' do
      VCR.use_cassette('moviedb_movies', re_record_interval: 7.days) do
        visit '/users/1/movies/2/party/new'

        fill_in :start_date, with: '12/03/2021'
        fill_in :start_time, with: '08:30 PM'
        click_button 'Create Party'

        expect(page.status_code).to eq 200
        expect(page).to have_content("Ariel")
        expect(page).to have_content("73")
        expect(page).to have_content("12/03/2021")
        expect(page).to have_content("08:30 PM")
      end
    end
  end
end