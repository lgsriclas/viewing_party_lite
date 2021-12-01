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
      visit "/users/100"
      save_and_open_page
      expect(page).to have_content("#{user_1.name}'s Dashboard")
    end 

    it 'has a button to discover movies' do 
      expect(page).to have_button("Discover Movies")
    end 

    it 'has a section that lists viewing parties' do 
      expect(page).to have_content("Viewing Parties")

      within "#"
    end 
  end 
end 