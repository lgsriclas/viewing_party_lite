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

    it 'has a link to log in' do
      user = create(:user, name: "Woodstock", email: "woodstock@peanuts.com", password: "snoopy123", password_confirmation: "snoopy123")
      expect(page).to have_link("Login")

      click_link "Login"
      expect(current_path).to eq("/login")

      fill_in :email, with: "woodstock@peanuts.com"
      fill_in :password, with: "snoopy123"
      click_button "Login"

      expect(current_path).to eq("/users/#{user.id}")
      expect(page).to have_content(user.name)
      expect(page).to have_content("Welcome Back #{user.name}")
    end
  end
end