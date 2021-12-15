require 'rails_helper'

RSpec.describe 'user login page' do
  describe 'happy path' do
    it 'has a form to log in' do
      user = create(:user, name: "Woodstock", email: "woodstock@peanuts.com", password: "snoopy123", password_confirmation: "snoopy123")

      visit "/login"

      fill_in :email, with: "woodstock@peanuts.com"
      fill_in :password, with: "snoopy123"
      click_button "Login"

      expect(current_path).to eq("/users/#{user.id}")
      expect(page).to have_content(user.name)
      expect(page).to have_content("Welcome Back #{user.name}")
    end
  end

  describe 'sad path' do
    it 'redirects to login if credentials are invalid' do
      user = create(:user, name: "Woodstock", email: "woodstock@peanuts.com", password: "snoopy123", password_confirmation: "snoopy123")

      visit "/login"

      fill_in :email, with: "woodstock@peanuts.com"
      fill_in :password, with: ""
      click_button "Login"

      expect(current_path).to eq("/login")
    end
  end
end