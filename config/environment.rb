# Load the rails application
require File.expand_path('../application', __FILE__)

# We need FasterCSV for exporting to CSV files
require 'fastercsv'

# Initialize the rails application
Cs657Phonebook::Application.initialize!

