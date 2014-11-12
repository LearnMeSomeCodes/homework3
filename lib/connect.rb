require 'active_record'

puts "Establishing connection..."

ActiveRecord::Base.establish_connection({
	adapter: "sqlite3",
	database: "./library.db"
})

puts "Connected!\n\n"
