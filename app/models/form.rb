class Form
  include Mongoid::Document

  field :name

  embeds_many :page

  def get_all_questions
    questions = []

    self.page.each do |page|
      questions += page.question

      page.section.each do |section|
        questions += section.question
      end
    end

    questions
  end


end