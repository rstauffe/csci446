# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.delete_all
Cat.create(name: 'Charles', breed: 'Tabby', image_url: 'tabby-cat.jpg', 
	description: 
	%{<p>Charles is a 5-year-old tabby looking for a good home. He has a tendency
		to eat shoelaces, but he's also a lapcat for those who like a lover.</p>},
    status: 'Available')
		
Cat.create(name: 'Naomi', breed: 'Siamese', image_url: 'siamese.jpg', 
	description:
	%{<p>Naomi is a 2-year-old Siamese cat. Originally a stray, she has adapted well
		to domestic life, and she's ready to find a good home.</p>},
    status: 'Available')
    
Cat.create(name: 'Charles II', breed: 'Tabby', image_url: 'tabby-cat.jpg', 
	description: 
	%{<p>Charles II is Charles' twin, but someone already adopted him.</p>},
    status: 'Fostered')