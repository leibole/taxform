require 'rails_helper'

describe 'My behaviour' do

  it 'should create details for a user filling a form' do
    load "#{Rails.root}/db/seeds.rb"

    user_form_details = {
        ssn: 100,
        first_name: 'john',
        last_name: 'doe',
        employee_name: ['name1', 'name2'],
        employee_salary: [100, 200]
    }

    form = Form.find_by(name: '106')
    user = User.find_or_create_by( ssn: user_form_details[:ssn] )
    UserForm.create!( user: user, form: form )

    details = [
        Detail.find_by(name: 'first_name'),
        Detail.find_by(name: 'last_name'),
        Detail.find_by(name: 'employee_name'),
        Detail.find_by(name: 'employee_salary')
    ]

    details.each do |detail|
      UserDetails.create!(detail: detail, user: user, value: user_form_details[detail.name.to_sym])
    end



    true.should == true
  end

  it 'should get details of a user for a form' do
    form = Form.find_by(name: '106')
    form_questions = form.get_all_questions
    user = User.find_by( ssn: 100 )

    UserForm.create!

    details = {}

    form_questions.each do |question|
      details[question.detail.name] = UserDetails.find_by(detail: question.detail, user: user).value
    end

    puts details
  end

  it 'should list all forms filled by a user' do
    user_forms = UserForm.find_by(user_id: User.find_by(ssn: 100).id)
    puts user_forms.form
  end
end