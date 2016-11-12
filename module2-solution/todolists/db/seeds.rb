# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [
  [ "Carly", "Fiorina", 1954, "female", "abc123" ],
  [ "Donald", "Trump", 1946, "male", "qwerty" ],
  [ "Ben", "Carson", 1951, "male", "mind" ],
  [ "Hillary", "Clinton", 1947, "female", "relative" ]
]

year_from_now = Date.today + 1.year
todo_items_count = 5

Profile.destroy_all
User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

user_list.each do |first_name, last_name, birth_year, gender, password|
  user = User.create!(username: last_name, password_digest: password)
  profile = Profile.create!(gender: gender, birth_year: birth_year, first_name: first_name, last_name: last_name, user: user)
  todo_list = TodoList.create!(list_name: "#{first_name}'s list", list_due_date: year_from_now, user: user)
  todo_items_count.times do |i|
  	TodoItem.create!(due_date: year_from_now, title: "Item #{i}", description: "Do the #{i}", todo_list: todo_list)
  end
end

