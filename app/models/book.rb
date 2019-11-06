# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :format

  validates :title, :price, presence: true
  validates :price, numericality: true
end
