require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the login path" do
    it "I can see a button to log in with Census" do
      visit login_path

      expect(page).to have_content("Log In with Census")
    end
  end
end
