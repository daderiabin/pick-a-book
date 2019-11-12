# frozen_string_literal: true

Page.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Page.create(title: 'About Us', content: 'Please fill it in.', permalink: 'about_us')
Page.create(title: 'Contact', content: 'Please fill it in.', permalink: 'contact')
