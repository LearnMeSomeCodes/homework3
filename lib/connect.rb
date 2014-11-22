require 'active_record'
require 'i18n'
require 'json'

puts "Establishing connection..."

ActiveRecord::Base.establish_connection({
	adapter: "sqlite3",

  ### Heh... Looks like this was copied from the Library example
  ### we did in class.
	database: "./library.db"
})

puts "Connected!\n\n"

I18n.enforce_available_locales = true