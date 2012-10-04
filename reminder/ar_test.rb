#File: ar_test.rb
require "active_record"
#Adapter for the SQLite3
ActiveRecord::Base::establish_connection(:adapter => "sqlite3", :database => "testdb.sqlite")
#Define database schema , and create database "people"
class ReminderTableScript < ActiveRecord::Migration
	def self.up
		create_table :reminders do |t|
		t.string :reminder
		t.string :due_date
		t.string :complete
		end
	end

	def self.down
		drop_table :reminders
	end
end
#Create the table that will be used in the database
ReminderTableScript.up unless File::exists?("testdb.sqlite")
class Reminder < ActiveRecord::Base
end

puts %q{Type "Reminder" to Enter a new reminder or "Examine" to see all your reminders}
x = gets.chomp()
if x == "Reminder"

	puts "Enter a Reminder:"
		r = gets.chomp()
	puts "Enter Due Date:"
		d = gets.chomp()
	puts "Complete or Incomplete?:"
		c = gets.chomp()

Reminder.new(:reminder => "#{r}", :due_date => "#{d}", :complete => "#{c}").save

elsif  x == "Examine"

	r = Reminder.find(:all)
	puts "#{r}"
else

	puts "Wrong Command Re-run program"

end
