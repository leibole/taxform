class Page
  include Mongoid::Document

  embeds_many :section
  embeds_many :question
end