class Entry < ActiveRecord::Base
  belongs_to :phonebook

  # validate the correctness of a phone number
  validates_format_of :phone,
    :message => "must be a valid telephone number.",
    :with => /^[\(\)0-9\- \+\.]{10,20}$/

  # validates that zip codes contain only numbers
  validates_format_of :zip,
    :message => "is an invalid zip code",
    :with => /(^\d{5}$)|(^\d{5}-\d{4}$)/
end
