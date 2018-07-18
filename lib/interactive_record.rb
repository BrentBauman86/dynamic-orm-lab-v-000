require_relative "../config/environment.rb"
require 'active_support/inflector'
# require "pry"
class InteractiveRecord

  def self.table_name
    # binding.pry
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true
    sql = "pragma table_info('#{table_name}')"

    table_info = DB[:conn].execute(sql)
    column_names = []

    table_info.each do |row|
      column_names << row["name"]
    end
    column_names.flatten
  end

  def initilize(options={})
    options.each do |key, value|
      self.send("#{key}=", value)
  end
end

  def attr_accessor
    self.column_names.each {|col_name| attr_accessor col_name.to_sym}
  end

  def table_name_for_insert
    self.class.table_name
  end
end
