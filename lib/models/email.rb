require 'active_record'

class Email < ActiveRecord::Base

  ### Nice!  Thanks for adding validation!
	validates :category, presence: true
	validates :address, presence: true

	belongs_to :name

end