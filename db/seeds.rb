# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
Faker::UniqueGenerator.clear
account_list = []
postslist = []

50.times do |n|
	randUser = Faker::Internet.username
	a = Author.create!(
		username: randUser,
		email: randUser+"@"+Faker::Internet.domain_name,
		password: "admin"
	)
	account_list << a
	p = nil
	if(Faker::Boolean.boolean)
		p = Post.create!(
			title: Faker::Quotes::Shakespeare.hamlet_quote,
			body: Faker::Movie.quote,
			author_id: a.id
		)
	end
	postslist << p if p.present?
end
postslist.each do |po|
	account_list.each do |acc|
		if ((po.author != acc) && (rand(1..6) == 6))
			Comment.create!(
				author_id: acc.id,
				post_id: po.id,
				comment_text: Faker::Movie.quote)
		end
	end
end

Author.create!(
	username: "admin",
	email: Faker::Internet.free_email,
	password: "admin"
)	