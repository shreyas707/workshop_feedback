# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Department.create(name: "BCA")
Department.create(name: "MCA")
Department.create(name: "MTech")
Department.create(name: "CS")
Department.create(name: "IS")
Department.create(name: "Mechanical")
Department.create(name: "Civil")
Department.create(name: "EC")

i = 1
8.times do
	Instructor.create(name: "staff" + i.to_s, mobile: "123456789" + i.to_s, email: "instructor" + i.to_s + "@gmail.com")
	i += 1
end

i = 1
8.times do
	DepartmentInstructor.create(department_id: i, instructor_id: i)
	i += 1
end

QuestionType.create(name: "Text")
QuestionType.create(name: "Points")

Question.create(title: "The topics discussed was relevant to the current trend", question_type_id: 2)
Question.create(title: "Hands on session in understanding the topic was more effective", question_type_id: 2)
Question.create(title: "The instructor was knowledgeable on the topic", question_type_id: 2)
Question.create(title: "I would be interested in attending a follow-up, more advanced workshop on this same subject", question_type_id: 2)
Question.create(title: "I will recommend this workshop to other students", question_type_id: 2)
Question.create(title: "What did you most appreciate/enjoy/think was best about the workshop? Any suggestions for improvement?", question_type_id: 1)
Question.create(title: "I would be able to do better if I knew more about", question_type_id: 1)
Question.create(title: "Please describe the top two topics you would like to learn more about in the next 12 months:", question_type_id: 1)
Question.create(title: "Comments (if any)", question_type_id: 1)

User.create(email: "admin@msrit.com", password: "secret123", password_confirmation: "secret123", username: "admin", role: "admin")
User.create(email: "bca@msrit.com", password: "secret123", password_confirmation: "secret123", username: "bca", role: "staff", department_id: 1)
User.create(email: "mca@msrit.com", password: "secret123", password_confirmation: "secret123", username: "mca", role: "staff", department_id: 2)
User.create(email: "mtech@msrit.com", password: "secret123", password_confirmation: "secret123", username: "mtech", role: "staff", department_id: 3)
User.create(email: "cs@msrit.com", password: "secret123", password_confirmation: "secret123", username: "cs", role: "staff", department_id: 4)
User.create(email: "is@msrit.com", password: "secret123", password_confirmation: "secret123", username: "is", role: "staff", department_id: 5)
User.create(email: "mechanical@msrit.com", password: "secret123", password_confirmation: "secret123", username: "mechanical", role: "staff", department_id: 6)
User.create(email: "civil@msrit.com", password: "secret123", password_confirmation: "secret123", username: "civil", role: "staff", department_id: 7)
User.create(email: "ec@msrit.com", password: "secret123", password_confirmation: "secret123", username: "ec", role: "staff", department_id: 8)


i = 1
8.times do
	j = 1
	15.times do
		department_name = Department.find(i).name
		User.create(email: "student" + j.to_s + department_name + "@msrit.com", password: "secret123", password_confirmation: "secret123", username: "student" + j.to_s + department_name, role: "student", department_id: i)
		j += 1
	end
	i += 1
end

i = 1
access = [true, false]
8.times do
	w = Workshop.new
	w.title = "Workshop" + i.to_s
	w.description = "This is workshop " + i.to_s + "."

	today = Date.today
	start_date = Date.parse "#{today.year}-#{today.month}-01"
	end_date = Date.parse "#{today.year}-#{today.month}-30"
	w.start_date = rand(start_date..end_date)
	w.end_date = w.start_date + rand(2...5).days

	w.user_id = i + 1

	w.allow_access = (w.start_date <= Date.today && w.end_date >= Date.today) ? true : false
	w.complete = (w.end_date < Date.today) ? true : false
	w.save

	DepartmentWorkshop.create(department_id: i, workshop_id: w.id)
	WorkshopInstructor.create(workshop_id: w.id, instructor_id: i)
	i += 1
end

options1 = ["Yes", "No"]
options2 = ["strongly-disagree", "disagree", "agree", "strongly-agree"]
Workshop.where(complete: true).each do |workshop|
	students = User.where(role: "student", department_id: workshop.user.department_id)
	students.each do |user|
		f = FeedbackForm.create(workshop_id: workshop.id, user_id: user.id)
		Question.all.each do |question|
			Answer.create(question_id: question.id, feedback: (question.question_type_id == 1) ? options2.sample : options1.sample, feedback_form_id: f.id)
		end
	end
end


