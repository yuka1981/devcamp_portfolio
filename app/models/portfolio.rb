# frozen_string_literal: true

class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true

  after_initialize :set_default

  private

  def set_default
    self.main_image ||= "https://via.placeholder.com/600x400"
    self.thumb_image ||= "https://via.placeholder.com/350x200"
  end
end
