# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

puts 'Please enter a ingredient'
print '> '
ingredient = gets.chomp

base_url = 'https://www.epicurious.com'
url = "#{base_url}/search/#{ingredient}?content=recipe"
html_file = URI.parse(url).open.read
html_doc = Nokogiri::HTML(html_file)

i = 0

puts "\n"
puts "Showing #{ingredient} recipes..."
puts "\n"
html_doc.search('.hed > a').each do |element|
  puts "#{element.text} - #{base_url}#{element.attribute('href')}"
  puts "\n"
  i += 1
end
puts "\n"
puts "Found #{i} recipes in this page."
