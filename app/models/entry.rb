class Entry < ActiveRecord::Base
  belongs_to :phonebook

  validates_format_of :phone,
    :message => "must be a valid telephone number.",
    :with => /^[\(\)0-9\- \+\.]{10,20}$/
end
