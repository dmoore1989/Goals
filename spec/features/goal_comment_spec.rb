require 'spec_helper'
require 'rails_helper'

feature "goal_comments" do
  feature "view comment" do
    it "allows comments to be viewed on goal show page" do
      sign_up_douggie
      add_goal_to_douggie
      visit('/goals/1')
      expect(page).to have_content("Comments")
    end
  end

  feature "add comment" do
    it "allows for submission of goal comments" do
      add_goal_comment
      expect(page).to have_content("Looking good bro!")
    end

    it "shows comment on goal show page with author name when submitted" do
      add_goal_comment
      expect(page).to have_content("jon")
    end
  end

  feature "delete comment" do
    before(:each) { add_goal_comment }

    it "allows for original commenter to submit deletion" do
      expect(page).to have_button("Delete Comment")
    end

    it "allows for goal to delete comment" do
      click_button 'Sign Out'
      login_douggie
      visit('/goals/1')
      expect(page).to have_button("Delete Comment")
    end

    it "doesn't allow for random goal to delete comment" do
      click_button 'Sign Out'
      login_morty
      visit('/goals/1')
      expect(page).to have_no_button("Delete Comment")
    end


    it "deletes the comment from the goals profile" do
      click_button("Delete Comment")
      expect(page).to have_no_content("Looking good bro!")
    end

  end

end
