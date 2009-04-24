class Node < ActiveRecord::Base
  belongs_to :book, :counter_cache => true
  belongs_to :term, :counter_cache => true
  
  named_scope :level, lambda { |level| { :conditions => { :level => level } } }

  def self.search(query, options = {})
    options[:conditions] ||= ["#{Node.table_name}.tree_number LIKE ?", "#{query}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 15
    options.delete_if {|k,v| k == :total_entries and v.nil?}
    paginate options
  end
  
  def children
    Node.find(:all, :conditions => ["tree_number LIKE ? AND level = ? AND book_id = ?", "#{tree_number}.%", level + 1, book_id])
  end
  
  def ancestors
    tree = tree_number.split(/\./)
    tree.pop
    ancestors = []
    tree.each_index do |i|
      tree_num = tree[0..i].join(".")
      ancestor = Node.find_by_tree_number_and_book_id(tree_num, book_id)
      ancestors.push(ancestor)
    end
    ancestors
  end
end
