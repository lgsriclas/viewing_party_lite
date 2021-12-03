require 'rails_helper'

RSpec.describe 'create viewing party' do
  describe 'happy path' do
    it 'allows user to create a viewing party' do
      VCR.use_cassette('moviedb_movies_4', re_record_interval: 7.days) do
        user = User.create!(name: "Snoopy", email: "snoopy@peanuts.com")

        visit "/users/#{user.id}/movies/2/party/new"

        fill_in :start_date, with: '12/03/2021'
        fill_in :start_time, with: '08:30 PM'
        click_button 'Create Party'

        expect(page.status_code).to eq 200
        expect(page).to have_content("Ariel")
        expect(page).to have_content("73")
        expect(page).to have_content("2021-03-12")
        expect(page).to have_content("22:30 PM")
      end
    end
  end
end