class Term < ActiveRecord::Base
  has_many :lines, :class_name => "LineItem"
  has_many :books, :through => :lines, :uniq => true

  def self.search(query, options = {})
    options[:conditions] ||= ["#{Term.table_name}.term LIKE ?", "#{query}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 10
    options.delete_if {|k,v| k == :total_entries and v.nil?}
    paginate options
  end
end
