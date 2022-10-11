# frozen_string_literal: true

require "rails_helper"

# if you need to open chrome browser to test it, should add the following setting to RSpec.describe
# driver: :selenium_chrome, js: true
RSpec.describe "Create portfolio", type: :feature do
  describe "from new portfolio path" do
    it "should create a new portfolio" do
      visit "/portfolios/new"
      fill_in :portfolio_title, with: "Portfolio title test"
      fill_in :portfolio_subtitle, with: "Portfolio subtitle"
      fill_in :portfolio_body, with: "This is portfolio body content"
      click_button "Create Portfolio"

      expect(page).to have_content "Portfolio title test"
      expect(page).to have_content "Portfolio subtitle"
      expect(page).to have_content "This is portfolio body content"
    end
  end

  describe "from portfolio index page" do
    context "enter new portfolio page" do
      it "should created a new portfolio" do
        visit "/portfolios"
        click_link "Create New Portfolio"

        fill_in :portfolio_title, with: "Portfolio title test from index page"
        fill_in :portfolio_subtitle, with: "Portfolio subtitle test from index page"
        fill_in :portfolio_body, with: "This is portfolio body content test from index page"
        click_button "Create Portfolio"

        expect(page).to have_content "Portfolio title test from index page"
        expect(page).to have_content "Portfolio subtitle test from index page"
        expect(page).to have_content "This is portfolio body content test from index page"
      end
    end
  end
end
