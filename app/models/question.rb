class Question
  include Mongoid::Document

  belongs_to :detail

end