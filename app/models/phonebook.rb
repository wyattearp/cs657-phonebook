class Phonebook < ActiveRecord::Base
  belongs_to :user
  has_many :entries

  # validates that phonebooks are named uniquely
  validates :name, :presence    => true,
                   :uniqueness  => true
end
