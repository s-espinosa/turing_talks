require 'rails_helper'

describe "As an admin" do
  describe "when I visit the show page for an inning" do
    it "I can add a session" do
      admin  = User.create(role: 1)
      inning = Inning.create(name: "1806")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_inning_path(inning)

      click_on("Add a Presentation Date")

      fill_in("presentation[due_date]", with: "10/1/2019")
      fill_in("presentation[date]", with: "12/1/2019")

      click_on "Add Presentation Date"

      expect(page).to have_content("Successfully created presentation date")
      expect(page).to have_content("1806")
      expect(page).to have_content("Presentation Date 1: January 12, 2019")
    end
  end
end
