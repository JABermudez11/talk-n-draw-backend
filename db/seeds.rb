# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
Pending.destroy_all
UserConversation.destroy_all
User.destroy_all

u1 = User.create!(username: "john", password_digest: "foo")
u2 = User.create!(username: "joh", password_digest: "foo")
u3 = User.create!(username: "jo", password_digest: "foo")
