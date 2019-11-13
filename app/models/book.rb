# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :price, presence: true
  validates :price, numericality: true

  belongs_to :book_format
  has_many :book_genres
  has_many :genres, through: :book_genres
  accepts_nested_attributes_for :book_genres, allow_destroy: true

  has_one_attached :image

  def self.search(search, format)
    if search
      where('title LIKE ? AND book_format_id LIKE ?', "%#{search}%", "%#{format}%")
    else
      all
    end
  end
end
