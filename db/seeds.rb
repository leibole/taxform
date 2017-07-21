# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


first_name_detail = Detail.create!( type: 'text', name: 'first_name' )
last_name_detail = Detail.create!( type: 'text', name: 'last_name' )

question_first_name = Question.new( detail: first_name_detail )
question_last_name = Question.new( detail: last_name_detail )

section = Section.new( question: [question_first_name, question_last_name] )


employee_name_detail = Detail.create!( type: 'text', name: 'employee_name' )
employee_salary_detail = Detail.create!( type: 'number', name: 'employee_salary' )

question_employee_name = Question.new( detail: employee_name_detail )
question_salary_detail = Question.new( detail: employee_salary_detail )

multi_section = Section.new( question: [question_employee_name, question_salary_detail], is_multiplicble: true )


page = Page.new( section: [section, multi_section] )

Form.create!(page: [page], name: '106')


