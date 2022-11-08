# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
Faker::UniqueGenerator.clear

author_list = []

100.times do |n|
	a = Author.create!(
			username: Faker::Internet.username,
			email: Faker::Internet.email,
			password_digest: "admin"
		)
	author_list << a
	3.times do |n2|
		if(Faker::Boolean.boolean)
			Post.create!(
				title: Faker::Lorem.words(number: rand(2..20)).join(" "),
				body: Faker::Lorem.paragraph(sentence_count: rand(2..20)),
				author_id: a.id
			)
		end
	end
end