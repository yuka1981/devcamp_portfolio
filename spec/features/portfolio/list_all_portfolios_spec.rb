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

    it "should list all portfolios" do
      visit portfolios_path

      expect(page).to have_content("Portfolio title test index 0")
      expect(page).to have_content("Portfolio title test index 1")
    end

    it "should have edit link below each portfolios" do
      visit portfolios_path

      expect(page).to have_link("Edit")
    end
  end
end
