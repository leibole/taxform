class Section
  include Mongoid::Document

  embeds_many :section
  embeds_many :question

  field :is_multiplicble
end