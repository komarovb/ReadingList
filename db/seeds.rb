# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.destroy_all
Genre.destroy_all

fiction=Genre.create!(name:'Fiction')
non_fiction=Genre.create!(name:'Non-Fiction')
apple=Genre.create!(name:'Apple')

Book.create! ([{
	title: "Hyperion",
	author: "Dan Simmons",
	description: "Description 1",
	amazon_id: "0553283685",
	rating: 5,
	finished_on: 10.days.ago,
	genres:[fiction]
},
{
	title: "Mindstorms",
	author: "Seymour A. Papert",
	description: "Description 2",
	amazon_id: "0465046746",
	rating: 3,
	finished_on: nil,
	genres: [non_fiction, apple]
}
	])
