class Term < ActiveRecord::Base
  def self.search(query, options = {})
    options[:conditions] ||= ["#{Term.table_name}.term LIKE ?", "#{query}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end
end
