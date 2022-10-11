# frozen_string_literal: true

require "rails_helper"

RSpec.describe "List all portfolios in portfolio index page", type: :feature do
  describe "Enter portfolio index page" do
    let!(:portfolios) do
      2.times do |index|
        Portfolio.create(title: "Portfolio title test index #{index}",
          subtitle: "Portfolio subtitle test index #{index}",
          body: "Portfolio body index #{index}"
        )
      end
    end

    let(:first_portfolio) { Portfolio.first }
    let(:second_portfolio) { Portfolio.second }

    it "should list all portfolios" do
      visit portfolios_path

      expect(page).to have_content("Portfolio title test index 0")
      expect(page).to have_content("Portfolio title test index 1")
    end

    it "should have edit link below each portfolios" do
      visit portfolios_path

      expect(page).to have_link("Edit")
    end

    it "should have show link in portfolio title" do
      visit portfolios_path

      expect(page).to have_link("Portfolio title test index 0", href: "/portfolios/#{first_portfolio.id}")
      expect(page).to have_link("Portfolio title test index 1", href: "/portfolios/#{second_portfolio.id}")
    end
  end
end
