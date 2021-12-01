require 'rails_helper'

RSpec.describe 'new user registration page' do
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
    click_on "Register"

    expect(page).to have_content("Snoopy")
    expect(page).to have_link("Home")
    expect(page).to have_content("Welcome Snoopy")
  end

  it 'register new user sad path' do
    visit '/register'

    fill_in :name, with: ""
    fill_in :email, with: "sally@peanuts.com"

    expect(current_path).to eq('/register')
  end
end