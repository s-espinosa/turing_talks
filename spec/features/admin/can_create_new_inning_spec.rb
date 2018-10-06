require 'rails_helper'

describe "As an admin" do
  describe "when I visit the dashboard" do
    it "I can create a new inning" do
      visit admin_dashboard_path

      # And I click on create new inning
      click_on("Create New Inning")
        # and I fill in a form with
        # fill in the name of inning
      fill_in("inning[name]", with: "1810")
        # cohorts presenting that inning
        # cohorts voting that inning
        # dates of lightning talks
        # fill_in("Week 2 Date", with: "October 12")
        # fill_in("Week 3 Date", with: "October 19")
        # fill_in("Week 4 Date", with: "October 26")
        # dates that talks are due
        #  fill_in("Topics Due", with: "October 8")
        # and I click submit
      click_on("Create Inning")
      save_and_open_page
        # then I see a new inning has been created
      expect(page).to have_content("Inning was successfully created")
    end
  end
end
