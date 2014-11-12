require 'active_record'

class Email < ActiveRecord::Base

	validates :category, presence: true
	validates :address, presence: true

	belongs_to :name

end