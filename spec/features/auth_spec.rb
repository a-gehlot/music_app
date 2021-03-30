require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign up"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "testing@email.com"
      fill_in 'Password', :with => "biscuits"
    #   save_and_open_page
      click_button "submit!"
    end

    scenario "redirects to bands index page after signup" do
        expect(page).to have_content("testing@email.com")
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "testing@email.com"
      click_on "submit!"
    end

    scenario "re-renders the signup page after failed signup" do
        expect(page).to have_content "Sign up"
        expect(page).to have_content "Password is too short"
    end
  end

end