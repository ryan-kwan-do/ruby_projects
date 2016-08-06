require 'pstore'

#this file is for working with people
class Person
  attr_accessor :name, :job, :gender, :age
end

store = PStore.new("people_storage")

#puts the existing data in people_storage into a local variable
people = []
store.transaction  do
  people = store[:people]	
end

puts "Would you like to enter a new person? Y/N"

if gets.chomp == "Y"
  new_person = Person.new

  puts "Enter name:"
  new_person.name = gets.chomp

  puts "Enter job:"
  new_person.job = gets.chomp

  puts "Enter gender:"
  new_person.gender = gets.chomp

  puts "Enter age:"
  new_person.age = gets.chomp.to_i

  store.transaction do
    store[:people] << new_person
  end
  else puts "bye then!"
end  