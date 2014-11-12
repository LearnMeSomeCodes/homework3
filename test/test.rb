class PhoneNumber < ActiveRecord::Base
	AddressEntry.create(first_name: Rick, last_name: James)
	address_1 = AddressEntry.find(1)
	PhoneNumber.create(category: "mobile", address_index: address_1.id)
	# List phone numbers by each user id
	user_id = [1,2,3,4,5,6]
	user_id.each do |user_id|
		puts "#{PhoneNumber.find(user_id).digits}"
	end
end

# Searching by Email

# What if I can just use address_index to find the person?
# Who do you want to find?
AddressEntry.find(EmailAddress.find(2).address_index)