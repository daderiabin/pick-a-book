# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user

  has_many :line_items
  has_many :books, through: :line_items
  accepts_nested_attributes_for :line_items, allow_destroy: true
end
