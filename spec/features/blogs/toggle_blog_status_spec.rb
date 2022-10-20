# frozen_string_literal: true

require "rails_helper"

RSpec.describe "toggle blog status", type: :feature do
  before do
    2.times do |index|
      Blog.create(title: "blog title index #{index}",
                  body: "blog body index #{index}")
    end
  end

  context "when blog is draft" do
    context "click draft link" do
      it "should be changed to published" do
        visit blogs_path
        click_link("draft", href: "/blogs/blog-title-index-1/toggle_status")

        expect(page).to have_link("published", href: "/blogs/blog-title-index-1/toggle_status")
      end
    end
  end

  context "when blog is published" do
    context "click published link" do
      before do
        Blog.create(title: "blog title index 2",
                    body: "blog body index 2",
                    status: "published")
      end

      it "should be changed to draft" do
        visit blogs_path
        click_link("published", href: "/blogs/blog-title-index-2/toggle_status")

        expect(page).to have_link("draft", href: "/blogs/blog-title-index-2/toggle_status")
      end
    end
  end
end
