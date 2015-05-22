# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: 'Jonathan', email: 'klaha.77@gmail.com', username: 'aikaryu', password: 'klonoa')
list = List.create(name: 'Gaming Websites', user_id: user.id, permissions: 'private')
item = Item.create(name: 'www.destructoid.com', list_id: list.id)