# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Show portfolio", type: :feature do
  describe "when click at portfolio title" do
    before do
      2.times do |index|
        Portfolio.create(title: "Portfolio title test index #{index}",
          subtitle: "Portfolio subtitle test index #{index}",
          body: "Portfolio body index #{index}"
        )
      end
    end

    let(:first_portfolio) { Portfolio.first }
    let(:second_portfolio) { Portfolio.second }

    it "should show portfolio details" do
      visit portfolios_path
      click_link first_portfolio.title.to_s

      expect(page).to have_content(first_portfolio.title.to_s)
      expect(page).to have_content(first_portfolio.subtitle.to_s)
      expect(page).to have_content(first_portfolio.body.to_s)
      expect(page).not_to have_content(second_portfolio.title.to_s)
    end
  end
end
