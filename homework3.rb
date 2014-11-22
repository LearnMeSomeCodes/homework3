require_relative 'lib/connect'
require_relative 'models'

puts "####################################\n### Welcome to your address book ###\n####################################\n"

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
    print "Please provide a category: "
    phone.category = gets.chomp
    print "Please provide a number: "
    phone.digits = gets.chomp

    ### Enhancement: You can actually check that the Phone is valid
    ###              at this point in the code:
    ###
    ###                if phone.valid?
    ###                  entry.phones.push phone
    ###                else
    ###                  ... ?
    ###                end
    ###
    entry.phones.push phone
  end
  
  print "How many email addresses would you like to add? "
  number_of_email = gets.chomp.to_i
  number_of_email.times do
    email = Email.new
    print "Please provide a category: "
    email.category = gets.chomp
    print "Please provide an address: "
    email.address = gets.chomp
    entry.emails.push email
  end

  puts "\nSaving...\n"
  ### Nice!  Glad to see that you verified that the save actually worked.
  if entry.save
    puts "Saved successfully!"
  else
    puts "Save failed."
    puts "Here were the validation messages:"

    ### Nice!
    puts "#{entry.errors.messages}"
  end

  puts menu

end

def search

  puts "\nYou are searching your address book by last name.\n\n"
  print "Please provide the last name you'd like to search for: "
  user_input = gets.chomp

  ### Good!  Using the 2-parameter form of the #where method,
  ###        which protects against SQL injection.
  query = Name.where("last_name like ?", user_input)
  puts "\nFound #{query.count} matches!"

  query.each do |object|
    
    puts "\nFirst name: #{object.first_name}"
    puts "Last name: #{object.last_name}"
    
    puts "Phone numbers:\n"

    ### FYI: Actually, you don't need to query for the Phone instances
    ###      manually.  Instead, you can just do this:
    ###
    ###        # object is an instance of Name, which means it has
    ###        # a #phones instance method:
    ###        query_phone = object.phones
    ###
    query_phone = Phone.where("name_id like ?", object.id)
    query_phone.each.with_index do |object, index|
      puts "   [#{index+1}] #{object.digits} (#{object.category})"
    end

    puts "Email addresses:\n"
    query_email = Email.where("name_id like ?", object.id)
    query_email.each.with_index do |object, index|
      puts "   [#{index+1}] #{object.address} (#{object.category})"
    end

    puts "\n*******************************************"
  
  end

  ### Enhancement: Currently, you keep looping back to the main menu
  ###              by invoking the #menu method again.  Instead, consider
  ###              allowing the #search method to return.  This will
  ###              cause the execution to pick up from where it left
  ###              off within the caller.  Assuming you have made this
  ###              change, how will this impact your #menu method?
  ###
  ### Note: Your #menu method does not actually return a string.  So,
  ###       the call to #puts is unnecessary here.
  puts menu

end


### Note: Your #menu method does not actually return a string.  So,
###       the call to #puts is unnecessary here.
puts menu