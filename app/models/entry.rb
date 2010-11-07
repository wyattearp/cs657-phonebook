class Entry < ActiveRecord::Base
  belongs_to :phonebook

  validates_format_of :phone,
    :message => "must be a valid telephone number.",
    :with => /^[\(\)0-9\- \+\.]{10,20}$/

  validates_format_of :zip,
    :message => "is an invalid zip code",
    :with => /(^\d{5}$)|(^\d{5}-\d{4}$)/
end
