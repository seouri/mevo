class LineItem < ActiveRecord::Base
  belongs_to :book, :counter_cache => true
  belongs_to :term, :counter_cache => true

  def self.search(query, options = {})
    options[:conditions] ||= ["#{LineItem.table_name}.tree_number LIKE ?", "#{query}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 15
    options.delete_if {|k,v| k == :total_entries and v.nil?}
    paginate options
  end
end
