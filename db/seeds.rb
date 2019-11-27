# frozen_string_literal: true

# Page.destroy_all
# Province.destroy_all
Book.destroy_all
BookFormat.destroy_all
Genre.destroy_all

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# Page.create(title: 'About Us', content: 'Please fill it in.', permalink: 'about_us')
# Page.create(title: 'Contact', content: 'Please fill it in.', permalink: 'contact')

# rates = [
#   ['AB', 0, 0.05, 0],
#   ['BC', 0, 0.05, 0.07],
#   ['MB', 0, 0.05, 0.08],
#   ['NB', 0.15, 0, 0],
#   ['NL', 0.15, 0, 0],
#   ['NS', 0.15, 0, 0],
#   ['ON', 0.13, 0, 0],
#   ['PE', 0.15, 0, 0],
#   ['SK', 0, 0.05, 0.06],
#   ['QC', 0, 0.05, 0.09975]
# ]

# rates.each do |r|
#   Province.create(name: r[0], hst: r[1], gst: r[2], pst: r[3])
# end
# puts 'Added ' + Province.count.to_s + ' provinces.'
# require 'csv'
file = Rails.root + 'db/csv/book_data.csv'
rows = SmarterCSV.process(file)
rows.each do |row|
  book = Book.new
  book.title = row[:book_title]
  book.year = Faker::Number.number(digits: 4)
  book.price = Faker::Commerce.price()

  if row[:genres].nil?
    g = Genre.find_or_create_by(name: 'Novels')
    book.genre_ids << g.id
  else
    book_genres = row[:genres].to_s.split('|')
    book_genres.each do |genre|
      g = Genre.find_or_create_by(name: genre)
      book.genre_ids = book.genre_ids << g.id
    end
  end

  book_formats = row[:book_format].to_s.split('|')
  book_formats.each do |b_format|
    f = BookFormat.find_or_create_by(name: b_format)
    book.book_format_id = f.id
  end

  book.save
end

puts 'Added ' + Book.count.to_s
puts 'Added ' + BookFormat.count.to_s
puts 'Added ' + Genre.count.to_s
