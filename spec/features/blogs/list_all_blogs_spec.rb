# frozen_string_literal: true

require "rails_helper"

RSpec.describe "list all blogs in the index page" do
  before do
    2.times do |index|
      Blog.create(title: "Blog test title #{index}", body: "Blog test body #{index}")
    end
  end

  let(:first_blog) { Blog.friendly.first }
  let(:second_blog) { Blog.second }

  it "should list all blogs" do
    visit blogs_path

    expect(page).to have_content("Blog test title 0")
    expect(page).to have_content("Blog test body 0")
  end

  it "should have edit link below each blog" do
    visit blogs_path

    expect(page).to have_link("Edit")
  end

  it "should have delete link below each blog" do
    visit blogs_path

    expect(page).to have_link("Delete")
  end

  it "should have show link in blog title" do
    visit blogs_path

    expect(page).to have_link("Blog test title 0", href: "/blogs/blog-test-title-0")
    expect(page).to have_link("Blog test title 1", href: "/blogs/blog-test-title-1")
  end
end
