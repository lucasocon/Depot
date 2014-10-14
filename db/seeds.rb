# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create!(title: 'Programming Ruby 1.9 & 2.0',
	description:
	%{<p>
		Ruby is the fastest growing and most exciting dynamic language
		out there. If you need to get working programs delivered fastest
		you shpuld add Ruby to your toolboxx.
		</p>},
	image_url: 'ruby.jpg',
	price:49.95)
Product.create!(title: 'CoffeeScript',
	description:
	%{<p>
		CoffeeScript is a little language that compiles into JavaScript. 
		Underneath that awkward Java-esque patina, JavaScript has always had a gorgeous heart.
		</p>},
	image_url: 'cd.jpg',
	price:50.95)
Product.create!(title: 'Agile Web Development with Rails 4',
	description:
	%{<p>
		Ruby on Rails helps you produce high-quality, beautiful-looking web applications quickly. 
		You concentrate on creating the application, and Rails takes care of the details.
		Tens of thousands of developers have used this award-winning book to learn Rails. 
		</p>},
	image_url: 'rails.png',
	price:43.45)
