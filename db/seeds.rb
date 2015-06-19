# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.destroy_all
Genre.destroy_all
User.destroy_all


fiction=Genre.create!(name:'Fiction')
non_fiction=Genre.create!(name:'Non-Fiction')
horror=Genre.create!(name:'Horror')
comedy=Genre.create!(name:'Comedy')

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
	title: "One Hundred Years of Solitude",
	author: "Gabriel Garcia Marquez",
	description: "One Hundred Years of Solitude tells the story of the rise and fall, birth and death of the mythical town of Macondo through the history of the Buend&#237;a family. Inventive, amusing, magnetic, sad, and alive with unforgettable men and women -- brimming with truth, compassion, and a lyrical magic that strikes the soul -- this novel is a masterpiece in the art of fiction.",
	amazon_id: "0060883286",
	rating: 5,
	finished_on: 30.days.ago,
	genres:[fiction]
},
{
	title: "The Call of the Wild",
	author: "Jack London",
	description: "This anthology is a thorough introduction to classic literature for those who have not yet experienced these literary masterworks. For those who have known and loved these works in the past, this is an invitation to reunite with old friends in a fresh new format. From Shakespeare’s finesse to Oscar Wilde’s wit, this unique collection brings together works as diverse and influential as The Pilgrim’s Progress and Othello. As an anthology that invites readers to immerse themselves in the masterpieces of the literary giants, it is must-have addition to any library.",
	amazon_id: "1503302946",
	rating: 4,
	finished_on: nil,
	genres: [non_fiction]
}
	])
book1=Book.create({
	title: "Mindstorms",
	author: "Seymour A. Papert",
	description: "Description 2",
	amazon_id: "0465046746",
	rating: 3,
	finished_on: nil,
	genres: [non_fiction]
})
book2=Book.create({
	title: "The Road",
	author: "Jack London",
	description: "This anthology is a thorough introduction to classic literature for those who have not yet experienced these literary masterworks. For those who have known and loved these works in the past, this is an invitation to reunite with old friends in a fresh new format. From Shakespeare’s finesse to Oscar Wilde’s wit, this unique collection brings together works as diverse and influential as The Pilgrim’s Progress and Othello. As an anthology that invites readers to immerse themselves in the masterpieces of the literary giants, it is must-have addition to any library.",
	amazon_id: "1466203277",
	rating: 3,
	finished_on: nil,
	genres: [non_fiction]
})
User.create!({
	first_name: "Borys",
	last_name: "Komarov",
	email: "fisika80@gmail.com",
	password: "1q2w3e4r5t",
	role: "nu",
	books: [book1, book2]
	})
User.create!({
	first_name: "Admin",
	last_name: "Adminovich",
	email: "admin@e.com",
	password: "123456",
	role: "au"
	})