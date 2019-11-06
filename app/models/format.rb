# frozen_string_literal: true

class Format < ApplicationRecord
  has_many :books

  validates :name, presence: true
  validates :name, uniqueness: true
end
