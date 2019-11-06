# frozen_string_literal: true

class Page < ApplicationRecord
  validates :title, :content, :permalink, presence: true
end
