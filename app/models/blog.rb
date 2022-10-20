# frozen_string_literal: true

class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :ordered_by_updated_at, -> { order(updated_at: :desc) }
end
