require 'pstore'

#creating a person class with two people to store 
class Person
  attr_accessor :name, :job, :gender, :age
end

bob = Person.new
bob.name = "Bob"
bob.job = "fish monger"
bob.age = 52

daisy = Person.new
daisy.name = "Daisy"
daisy.job = "Spy"
daisy.gender = "F"
daisy.age = 26

# saving some initial data to pstore
store = PStore.new("people_storage")
store.transaction do
  store[:people] ||= Array.new
  store[:people] << bob
  store[:people] << daisy
end