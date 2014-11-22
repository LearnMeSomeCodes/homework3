require 'active_record'

class Name < ActiveRecord::Base
	
  ### Nice!  Thanks for adding validation!
	validates :first_name,
	          presence: true
	validates :last_name,
	          presence: true

	has_many :phones
	has_many :emails

end