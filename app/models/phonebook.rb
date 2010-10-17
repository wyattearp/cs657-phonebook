class Phonebook < ActiveRecord::Base
  belongs_to :user
  has_many :entries
end
