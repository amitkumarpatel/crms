# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create(name: :super_manager)
Role.create(name: :manager)
Role.create(name: :client)
Role.create(name: :guest)

user1 = User.create(username: 'Nicole',
								    email: 'super_manager@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user1.roles << Role.where(name: 'super_manager').first
#user1.add_role(:super_manager)
user2 = User.create(username: 'Bruce',
								    email: 'client@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234')
user1.roles << Role.where(name: 'client').first
#user2.add_role(:client)