# frozen_string_literal: true

# Page.destroy_all
Province.destroy_all

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# Page.create(title: 'About Us', content: 'Please fill it in.', permalink: 'about_us')
# Page.create(title: 'Contact', content: 'Please fill it in.', permalink: 'contact')

rates = [
  ['AB', 0, 0.05, 0],
  ['BC', 0, 0.05, 0.07],
  ['MB', 0, 0.05, 0.08],
  ['NB', 0.15, 0, 0],
  ['NL', 0.15, 0, 0],
  ['NS', 0.15, 0, 0],
  ['ON', 0.13, 0, 0],
  ['PE', 0.15, 0, 0],
  ['SK', 0, 0.05, 0.06],
  ['QC', 0, 0.05, 0.09975]
]

rates.each do |r|
  Province.create(name: r[0], hst: r[1], gst: r[2], pst: r[3])
end
puts 'Added ' + Province.count.to_s + ' provinces.'
