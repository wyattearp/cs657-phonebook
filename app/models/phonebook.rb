class Phonebook < ActiveRecord::Base
  belongs_to :user
  has_many :entries

  validates :name, :presence    => true,
                   :uniqueness  => true
end
