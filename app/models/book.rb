# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :price, presence: true
  validates :price, numericality: true

  belongs_to :format
  has_and_belongs_to_many :genres
end
