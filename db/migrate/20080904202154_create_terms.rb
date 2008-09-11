class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.string :term, :uniq => true
      t.integer :books_count, :default => 0
    end
    add_index :terms, :term
  end

  def self.down
    drop_table :terms
  end
end
