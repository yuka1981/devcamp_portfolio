# frozen_string_literal: true

class Blog < ApplicationRecord
  enum status: {
    draft: 0,
    published: 1
  }

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :ordered_by_updated_at, -> { order(updated_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true
end
