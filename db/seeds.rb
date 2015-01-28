# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 4 subject
# Create Ruby on Rails subject
rorSubject = Subject.create(name: "Ruby on Rails", 
				instruction: "This is Ruby on Rails subject.", 
				status: 0, 
				created_at: Time.zone.now)
# Create Github subject
gitSubject = Subject.create(name: "GitHub",
				instruction: "This is Github subject.",
				status: 0,
				created_at: Time.zone.now)

# Create Mysql subject
sqlSubject = Subject.create(name: "MySQL",
				instruction: "This is MySQL subject.",
				status: 0,
				created_at: Time.zone.now)

# Create PHP subject
phpSubject = Subject.create(name: "PHP",
				instruction: "This PHP subject.",
				status: 0,
				created_at: Time.zone.now)

# Create tasks 
# Create 10 tasks for Ruby on Rails subject
10.times do |n|
	name = "Lecture #{n+1}"
	subject_id = rorSubject.id
	instruction = "This is #{name} of #{rorSubject.name}."
	status = 0
	created_at = Time.zone.now
	Task.create(name: name, 
				subject_id: subject_id, 
				instruction: instruction,
				status: status,
				created_at: created_at)
end

# Create 10 tasks for gitSubject
10.times do |n|
	name = "Lecture git #{n+1}"
	subject_id = gitSubject.id
	instruction = "This is #{name} of #{gitSubject.name}."
	status = 0
	created_at = Time.zone.now
	Task.create(name: name, 
				subject_id: subject_id, 
				instruction: instruction,
				status: status,
				created_at: created_at)
end

# Create 10 tasks for MySQL Subject
10.times do |n|
	name = "Lecture MySQL #{n+1}"
	subject_id = sqlSubject.id
	instruction = "This is #{name} of #{sqlSubject.name}."
	status = 0
	created_at = Time.zone.now
	Task.create(name: name, 
				subject_id: subject_id, 
				instruction: instruction,
				status: status,
				created_at: created_at)
end

# Create 10 tasks for phpSubject
10.times do |n|
	name = "Lecture PHP #{n+1}"
	subject_id = phpSubject.id
	instruction = "This is #{name} of #{phpSubject.name}."
	status = 0
	created_at = Time.zone.now
	Task.create(name: name, 
				subject_id: subject_id, 
				instruction: instruction,
				status: status,
				created_at: created_at)
end


###########################################################
# Create 5 course samples
4.times do |n|
	name = ""
	name << (65 + rand(26)).chr
	6.times{name << (48 + rand(9)).chr}
	name << (65 + rand(26)).chr
	instruction = "This is course #{name}."
	created_at = Time.zone.now
	status = 0
	Course.create(name: name,
					status: status,
					instruction: instruction,
					created_at: created_at)
end

