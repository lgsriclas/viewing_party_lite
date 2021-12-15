require 'rails_helper'

RSpec.describe 'movie show page' do
  describe 'happy path' do
    it 'shows movie data' do
      VCR.use_cassette('moviedb_movies_3', re_record_interval: 7.days) do
        user = create(:user)

        visit "users/#{user.id}/movies/120"

        expect(page.status_code).to eq 200
        expect(page).to have_content("The Lord of the Rings: The Fellowship of the Ring")
        expect(page).to have_content("Sean Bean : Boromir")
        expect(page).to have_content("LadyGreenEyes:")
        expect(page).to have_button("Create a Viewing Party")
      end
    end
  end
end