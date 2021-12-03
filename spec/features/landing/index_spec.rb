require 'rails_helper'

RSpec.describe 'landing page' do 
  describe 'happy path functionality' do
    let!(:users) { create_list(:user, 2) }

    before(:each) do
      visit root_path
    end 

    context 'when there are existing users' do 
      it 'shows all existing users' do 
        within "#users" do
          expect(page).to have_content("Existing Users:")
          expect(page).to have_content(users[0][:email])
          expect(page).to have_content(users[1][:email])
        end

        within "#users" do
          click_link "#{users[0][:email]}"

          expect(current_path).to eq("/users/#{users[0].id}")
      end
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

  describe 'sad path functionaily' do 
    context 'when there are no existing users' do 
      it 'shows all existing users' do 
        visit root_path
        within "#users" do 
          expect(page).to have_content("Existing Users:")
          expect(page).to have_content("There are no existing users. Create a new user to get started!")
        end 
      end 
    end 
  end 
end 