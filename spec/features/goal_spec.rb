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
    before(:each) { add_goal_to_douggie }

    it "shows goal when selected from user page" do
       click_link("Test Goal")
       expect(page).to have_content("Test Goal")
    end

    it "allows user to complete goal from show page" do
      click_link("Test Goal")
      choose('Complete')
      click_button('Update Goal')
      expect(page).to have_content('Goal is Completed!')
    end

      feature "private goal" do
        before(:each) { add_private_goal_to_douggie }

        it "allows only the correct user to see private goal" do
          expect(page).to have_content('Secret')

        end

        it "doesn't allow other users to see private goals" do
          click_button('Sign Out')
          login_as_jon
          visit('/users/1')
          expect(page).to have_no_content('Secret')
        end

      end
  end

  feature "delete goal" do
    before(:each) { add_goal_to_douggie }

    it "allows user to delete a goal from user page" do
      expect(page).to have_button('Delete Goal')
    end

    it "doesn't allow other user to delete goal" do
      click_button('Sign Out')
      login_as_jon
      visit('/users/1')
      expect(page).to have_no_content('Delete Goal')
    end

    it "deletes goal on submission" do
      click_button('Delete Goal')
      expect(page).to have_no_content('Test Goal')
    end
  end
end
