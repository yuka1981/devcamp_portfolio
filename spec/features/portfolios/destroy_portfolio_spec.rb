# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Destroy portfolio", driver: :selenium_chrome_headless, js: true, type: :feature do
  describe "from portfolio index page" do
    before do
      2.times do |index|
        Portfolio.create(title: "Portfolio title test index #{index}",
          subtitle: "Portfolio subtitle test index #{index}",
          body: "Portfolio body index #{index}"
        )
      end
    end

    let!(:first_portfolio) { Portfolio.first }
    let!(:second_portfolio) { Portfolio.second }

    context "when click delete button of first portfolio" do
      it "should be destroyed" do
        visit portfolios_path
        accept_confirm do
          find("a", text: "Delete", match: :first).click
        end

        expect(page).not_to have_content(first_portfolio.title.to_s)
        expect(page).to have_content(second_portfolio.title.to_s)
      end
    end
  end
end
