class LineItem < ActiveRecord::Base
  belongs_to :book, :counter_cache => true
  belongs_to :term, :counter_cache => true
end
