class Term < ActiveRecord::Base
  has_many :nodes
  has_many :books, :through => :nodes, :uniq => true

  def self.search(query, options = {})
    options[:conditions] ||= ["#{Term.table_name}.term LIKE ?", "#{query}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 10
    options.delete_if {|k,v| k == :total_entries and v.nil?}
    paginate options
  end
  
  def ancestors_and_children
    unique_nodes = []
    nodes.each do |node|
      unique_nodes.push(node.ancestors)
      unique_nodes.push(node)
      unique_nodes.push(node.children)
    end
    unique_nodes.flatten.uniq
  end
end
