# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Update portfolio", type: :feature do
  describe "when update portfolio" do
    let!(:portfolio_item) do
      Portfolio.create(title: "first portfolio title",
        subtitle: "first portfolio subtitle",
        body: "first portfolio body"
      )
    end

    context "change title content" do
      it "should be updated" do
        visit "portfolios/#{portfolio_item.id}/edit"
        fill_in :portfolio_title,	with: "Portfolio title updated"
        click_button "Update Portfolio"

        expect(page).to have_content "Portfolio title updated"
      end
    end

    context "change subtitle content" do
      it "should be updated" do
        visit "portfolios/#{portfolio_item.id}/edit"
        fill_in :portfolio_subtitle, with: "Portfolio subtitle updated"
        click_button "Update Portfolio"

        expect(page).to have_content "Portfolio subtitle updated"
      end
    end

    context "change body content" do
      it "should be updated" do
        visit "portfolios/#{portfolio_item.id}/edit"
        fill_in :portfolio_body, with: "Portfolio body updated"
        click_button "Update Portfolio"

        expect(page).to have_content "Portfolio body updated"
      end
    end
  end
end
