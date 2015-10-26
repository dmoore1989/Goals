require 'spec_helper'
require 'rails_helper'

feature "the goal process" do

  before(:each){ sign_up_douggie }

  it "allows a user to see all pending goals on log in" do
    expect(page).to have_content('Your Goals')
  end



  feature "new goals" do

    it "allows a user to add a goal" do
      click_link "Add Goal"
      expect(page).to have_content('Add Goal to Douggie')
    end

    it "adds goal to page once submitted" do
      add_goal_to_douggie
      expect(page).to have_content("Test Goal")
    end

  end

  feature "edit goals" do

    it "allows a user to edit their goals" do
      add_goal_to_douggie
      click_link "Edit Goal"
      expect(page).to have_content("Edit Goal")
    end

    it "updates goal on user page" do
      add_goal_to_douggie
      edit_test_goal
      expect(page).to have_content("Test Goal2")
    end

    it "does not allow other user to edit a goal" do
      add_goal_to_douggie
      click_button('Sign Out')
      login_as_jon
      visit('/users/1')
      expect(page).to have_no_content("Edit Goal")
    end

    it "redirects other user on edit" do
      add_goal_to_douggie
      click_button('Sign Out')
      login_as_jon
      visit('/goals/1/edit')
      expect(page).to have_content("Invalid User")
    end

  end

  feature "show goal" do
    it "shows goal when selected from user page"

    it "allows user to complete goal from show page"

    it "allows only the correct user to see private goal"
  end

  feature "delete goal" do
    it "allows user to delete a goal from user page"

    it "doesn't allow other user to delete goal"

    it "deletes goal on submission"
  end
end
