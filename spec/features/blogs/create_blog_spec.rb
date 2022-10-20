# frozen_string_literal: true

require "rails_helper"

RSpec.describe "create a blog", type: :feature do
  describe "from new link of index page" do
    it "should create a new blog" do
      visit blogs_path
      click_link "Create New Blog"

      fill_in :blog_title, with: "Blog title test"
      fill_in :blog_body, with: "Blog body test"
      click_button "Create Blog"

      expect(page).to have_content("Blog title test")
      expect(page).to have_content("Blog body test")
    end
  end
end
