require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit('/users/new')
    expect(page).to have_content('New User')
  end
  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      sign_up_douggie

      expect(page).to have_content('Douggie')
    end
  end

end

feature "logging in" do

  it "shows username on the homepage after login" do
    sign_up_douggie
    click_button "Sign Out"
    login_douggie

    expect(page).to have_content('Douggie')
  end
end

feature "logging out" do

  it "begins with logged out state" do
    visit ('/session/new')
    expect(page).to have_content('Sign In')
  end

  it "doesn't show username on the homepage after logout" do
    sign_up_douggie
    click_button "Sign Out"
    login_douggie
    click_button "Sign Out"

    expect(page).to have_content('Sign In')
  end

end
