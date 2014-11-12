require 'active_record'

class Name < ActiveRecord::Base
	
  validates :first_name,
            presence: true
  validates :last_name,
            presence: true

  has_many :phones
  has_many :emails

end