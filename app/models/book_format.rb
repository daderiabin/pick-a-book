# frozen_string_literal: true

class BookFormat < ApplicationRecord
  validates :name, presence: true
  has_many :books
end
