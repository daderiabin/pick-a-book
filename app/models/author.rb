class Author < ApplicationRecord
  validates :name, :address, presence: true
end
