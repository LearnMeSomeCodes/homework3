require 'active_record'

class Phone < ActiveRecord::Base
	
  ### Nice!  Thanks for adding validation!
	validates :category, presence: true
	validates :digits, presence: true
	
  	belongs_to :name

end