require 'rails_helper'

RSpec.describe 'user dashboard page' do
  describe 'functionality' do
    let!(:user_1) { create(:user) }
    let!(:user_2) { create(:user) }
    let!(:party_1) { create(:party, user_id: user_1.id, movie_id: 1) }
    let!(:party_2) { create(:party, user_id: user_1.id, movie_id: 2) }
    let!(:party_3) { create(:party, user_id: user_2.id, movie_id: 3) }
    let!(:invite) { Invite.create!(user_id: user_1.id, party_id: party_3.id) }

    before(:each) do
      visit "/users/#{user_1.id}"
    end

    it "contains the user's name in the title" do
      expect(page).to have_content("#{user_1.name}'s Dashboard")
    end

    it 'has a button to discover movies' do
      expect(page).to have_button("Discover Movies")
    end

    it 'has a section that lists viewing parties' do
      expect(page).to have_content("Viewing Parties:")

      within "#party-#{party_1.id}" do 
        expect(page).to have_content(party_1.movie_title)
        expect(page).to have_content(party_1.start_date.strftime("%B %e, %Y"))
        expect(page).to have_content(party_1.start_time.strftime("%I:%M %p"))
        expect(page).to have_content("Host")
      end 

      within "#party-#{party_2.id}" do 
        expect(page).to have_content(party_2.movie_title)
        expect(page).to have_content(party_2.start_date.strftime("%B %e, %Y"))
        expect(page).to have_content(party_2.start_time.strftime("%I:%M %p"))
        expect(page).to have_content("Host")
      end
      
      within "#party-#{party_3.id}" do 
        expect(page).to have_content(party_3.movie_title)
        expect(page).to have_content(party_3.start_date.strftime("%B %e, %Y"))
        expect(page).to have_content(party_3.start_time.strftime("%I:%M %p"))
        expect(page).to have_content("Invited")
      end 
    end
  end
end