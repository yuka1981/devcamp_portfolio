# frozen_string_literal: true

require "rails_helper"

# if you need to open chrome browser to test it, should add the following setting to RSpec.describe
# driver: :selenium_chrome, js: true
RSpec.describe "Create portfolio", type: :feature do
  it "create a portfolio" do
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
