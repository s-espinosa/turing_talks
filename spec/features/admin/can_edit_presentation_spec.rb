require 'rails_helper'

describe "As an admin" do
  describe "when I visit the show page for an inning" do
    it "I can add a session" do
      inning = Inning.create(name: "1806")
      inning.presentations.create(date: "12/1/2019", due_date: "10/1/2019")

      visit admin_inning_path(inning)

      click_on("Edit")

      fill_in("presentation[due_date]", with: "9/1/2019")
      fill_in("presentation[date]", with: "13/1/2019")

      click_on "Add Presentation Date"

      expect(page).to have_content("Successfully updated presentation date")
      expect(page).to have_content("1806")
      expect(page).to have_content("Presentation Date 1: January 13, 2019")
    end
  end
end
