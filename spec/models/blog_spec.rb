# frozen_string_literal: true

require "rails_helper"

RSpec.describe Blog, type: :model do
  describe "validataion" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end
end
