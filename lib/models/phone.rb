require 'active_record'

class Phone < ActiveRecord::Base
	
	validates :category, presence: true
	validates :digits, presence: true
	
  belongs_to :name

end