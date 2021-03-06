require 'rails_helper'

describe "As an admin" do
  describe "when I visit the dashboard" do
    it "I can create a new inning" do
      admin = User.create(role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_dashboard_path

      click_on("Create New Inning")
      fill_in("inning[name]", with: "1810")
      click_on("Create Inning")

      expect(page).to have_content("Inning was successfully created")
    end
  end
end
