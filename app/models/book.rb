class Book < ActiveRecord::Base
  has_many :lines, :class_name => "LineItem"
  has_many :terms, :through => :lines
end
