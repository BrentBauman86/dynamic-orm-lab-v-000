require_relative "../config/environment.rb"
require 'active_support/inflector'
# require "pry"
class InteractiveRecord

  def self.table_name
    # binding.pry
    self.to_s.downcase.pluralize
  end

  def self.column_names

    sql = "pragma table_info('#{table_name}')"
  end

end
