require 'rails_helper'

RSpec.describe 'new user registration page' do
  describe 'happy path' do
    it 'has a form to register a new user' do
      visit '/register'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Register New User")
      expect(page).to have_content("Name")
      expect(page).to have_content("Email")
      expect(page).to have_button("Register")
    end

    it 'can register a new user' do
      visit '/register'

      fill_in :name, with: "Snoopy"
      fill_in :email, with: "snoopy@peanuts.com"
      fill_in :password, with: "woodstock432"
      fill_in :password_confirmation, with: "woodstock432"
      click_on "Register"

      expect(page).to have_content("Snoopy")
      expect(page).to have_link("Home")
      expect(page).to have_content("Welcome Snoopy")
    end
  end

  describe 'Sad Path' do
    it 'blank form' do
      visit '/register'

      fill_in :name, with: ""
      fill_in :email, with: "sally@peanuts.com"
      fill_in :password, with: "sally123"
      fill_in :password_confirmation, with: "sally123"

      expect(current_path).to eq('/register')
    end

    it 'password and confirmation do not match' do
      visit '/register'

      fill_in :name, with: "Sally Brown"
      fill_in :email, with: "sally@peanuts.com"
      fill_in :password, with: "sally123"
      fill_in :password_confirmation, with: "sally432"

      expect(current_path).to eq('/register')
    end
  end
end