require 'rails_helper'

RSpec.describe 'landing page' do 
  describe 'functionality' do
    let!(:users) { create_list(:user, 2) }

    before(:each) do
      visit root_path
    end 

    it 'shows all existing users' do 
      save_and_open_page
      within "#users" do
        expect(page).to have_content("Existing Users:")
        expect(page).to have_content(users[0][:email])
        expect(page).to have_content(users[1][:email])
      end
    end 

    it 'has a button to create a new user' do 
      within "#new-user-button" do
        expect(page).to have_button("Create a New User")
      end 
    end 

    it 'has a link to go to the home page' do 
      click_link "Home"
      
      expect(current_path).to eq(root_path)
    end 

    it 'shows the application name' do 
      expect(page).to have_content("Viewing Party Lite")
    end 
  end 
end 