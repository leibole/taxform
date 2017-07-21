class UserDetails
  include Mongoid::Document

  belongs_to :user
  belongs_to :detail
  field :value
end