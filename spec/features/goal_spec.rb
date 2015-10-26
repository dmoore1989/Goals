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
      click_link "Add Goal"
      add_goal_to_douggie

      expect(page).to have_content("Test Goal")
    end

  end

  feature "edit goals" do

    it "allows a user to edit a goal"

    it "updates goal on user page"

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
