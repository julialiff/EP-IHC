
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

my_date_formats = { :default => '%d/%m/%Y' }

ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(my_date_formats)

ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(my_date_formats)
