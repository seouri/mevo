class Book < ActiveRecord::Base
  has_many :nodes
  has_many :terms, :through => :nodes, :uniq => true
end
