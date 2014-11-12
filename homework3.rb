require_relative 'lib/connect'
require_relative 'lib/models'

puts "####################################\n### Welcome to your address book ###\n####################################\n\n"

puts "We are going to create an address entry."
entry = Entry.new
print "Please provide the first name: "
entry.first_name = gets.chomp
print "Please provide the last name: "
entry.last_name = gets.chomp

puts entry.inspect