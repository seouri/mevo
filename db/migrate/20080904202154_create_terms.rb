class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.string :term
      t.string :term_ui, :limit => 7
    end
    add_index :terms, :term
  end

  def self.down
    drop_table :terms
  end
end
