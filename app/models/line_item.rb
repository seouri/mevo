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
  
  def children
    LineItem.find(:all, :conditions => ["tree_number LIKE ? AND indent = ? AND book_id = ?", "#{tree_number}.%", indent + 1, book_id])
  end
  
  def ancestors
    tree = tree_number.split(/\./)
    tree.pop
    ancestors = []
    tree.each_index do |i|
      tree_num = tree[0..i].join(".")
      ancestor = LineItem.find_by_tree_number_and_book_id(tree_num, book_id)
      ancestors.push(ancestor)
    end
    ancestors
  end
end
