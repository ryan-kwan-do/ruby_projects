require 'pstore'

#also works with a person class
class Person
  attr_accessor :name, :job, :gender, :age
end

#accessing pstore in a variable store
store = PStore.new("people_storage")

#puts the existing data in people_storage into a local variable
people = []
store.transaction  do
  people = store[:people]	
end

#puts data from people_storage
#puts the 3rd person's name:
puts people[2].name
puts "#{people[0].name} is #{people[0].age}"

#adds a new person
puts "Add a new person before you go"
new_person = Person.new

puts "Enter name:"
new_person.name = gets.chomp

puts "Enter job:"
new_person.job = gets.chomp

puts "Enter gender:"
new_person.gender = gets.chomp

puts "Enter age:"
new_person.age = gets.chomp.to_i

#stores new data:
store.transaction do
  store[:people] << new_person
end
