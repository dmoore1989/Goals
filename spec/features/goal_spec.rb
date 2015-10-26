require 'spec_helper'
require 'rails_helper'

feature "the goal process" do

  before(:each){ sign_up_douggie }

  it "allows a user to see all pending goals on log in" do
    expect(page).to have_content('Your Goals')
  end



  feature "new goals" do

    it "allows a user to add a goal" do
      sign_up_douggie
    end

    it "adds goal to page once submitted"

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
    it "allows user to be lazy, give up, and delete a goal because they suck"
  end
end
