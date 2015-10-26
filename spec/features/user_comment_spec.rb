require 'spec_helper'
require 'rails_helper'

feature "user_comments" do
  feature "view comment" do
    it "allows comments to be viewed on user show page" do
      login_as_jon
      visit('/users/1')
      expect(page).to have_content("Comments")
    end
  end

  feature "add comment" do
    it "allows for submission of user coomments" do
      add_comment
      expect(page).to have_content("Looking good bro!")
    end

    it "shows comment on user show page with author name when submitted" do
      add_comment
      expect(page).to have_content("jon")
    end
  end

  feature "delete comment" do
    before(:each) { add_comment }

    it "allows for original commenter to submit deletion" do
      expect(page).to have_button("Delete Comment")
    end

    it "allows for user to delete comment" do
      click_button 'Sign Out'
      login_douggie
      expect(page).to have_button("Delete Comment")
    end

    it "doesn't allow for random user to delete comment" do
      click_button 'Sign Out'
      login_morty
      visit('/users/1')
      expect(page).to have_no_button("Delete Comment")
    end


    it "deletes the comment from the users profile" do
      click_button("Delete Comment")
      expect(page).to have_no_content("Looking good bro!")
    end

  end

end
