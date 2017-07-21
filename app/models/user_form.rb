class UserForm
  include Mongoid::Document

  belongs_to :user
  belongs_to :form
end