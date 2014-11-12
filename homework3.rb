require_relative 'lib/connect'
require_relative 'lib/models'

puts "####################################\n### Welcome to your address book ###\n####################################\n\n"

def menu
  menu = ["create", "search", "quit"]
  user_input = ""
  while not menu.include? user_input do
    puts "\nEnter \"create\" to create a new entry.
Enter \"search\" to search for an entry.
Enter \"quit\" to quit the application.\n\n"
    print " > "
    user_input = gets.chomp
    if not menu.include? user_input
      puts "\nI'm sorry, that is not a valid entry. Please try again.\n"
    elsif user_input == "create"
      puts create
    elsif user_input == "search"
      puts search
    elsif user_input == "quit"
      puts "\nDont worry, your #{Name.count} entries are safe with me.\n\nGoodbye!\n\n"
      exit
    end
  end
end

def create

  entry = Name.new
  puts "\nYou are now creating a new address book entry.\n\n"
  print "Please provide the first name: "
  entry.first_name = gets.chomp
  print "Please provide the last name: "
  entry.last_name = gets.chomp
  
  print "How many phone numbers would you like to add? "
  number_of_phone = gets.chomp.to_i
  number_of_phone.times do
    phone = Phone.new
    print "Please provide a category (home, work, cell): "
    phone.category = gets.chomp
    print "Please provide a number (555-555-5555): "
    phone.digits = gets.chomp
    entry.phones.push phone
  end
  
  print "How many email addresses would you like to add? "
  number_of_email = gets.chomp.to_i
  number_of_email.times do
    email = Email.new
    print "Please provide a category (home, work): "
    email.category = gets.chomp
    print "Please provide an address: "
    email.address = gets.chomp
    entry.emails.push email
  end

  puts "Saving...\n"
  if entry.save
    puts "Saved successfully!"
  else
    puts "Save failed."
    puts "Here were the validation messages:"
    puts "#{entry.errors.messages}"
  end

  puts menu

end

def search

  puts "\nYou are searching your address book by last name.\n\n"
  print "Please provide the last name you'd like to search for: "
  user_input = gets.chomp
  query = Name.all.select {|i| i.last_name == "#{user_input}"}
  puts query.inspect
  puts "\nFound #{query.count} matches!"

  query.each do |index|
    puts "First name: #{query[index].first_name}"
    puts "Last name: #{query[index].last_name}"
    puts "Phone numbers:"
    query[index].phones.count.times do |index_2|
      puts "#{index} #{query[index].phones[index_2].digits} (#{query[index].phones[index_2].category})"
    end
    puts "Email addresses:"
    query[index].emails.count.times do |index_3|
      puts "#{index} #{query[index].emails[index_3].address} (#{query[index].emails[index_3].category})"
    end
    puts "*******************************************"
  end  

  puts menu

end

puts menu