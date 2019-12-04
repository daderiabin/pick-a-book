# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :order
end
