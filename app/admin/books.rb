# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :title, :year, :price, :book_format_id, book_genres_attributes: %i[id book_id genre_id _destroy]

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Book' do
      f.input :book_format
      f.input :title
      f.input :year
      f.input :price
      f.input :on_sale
      f.input :is_new
      f.has_many :book_genres, allow_destroy: true do |n_f|
        n_f.input :genre
      end
    end

    f.actions
  end
end
