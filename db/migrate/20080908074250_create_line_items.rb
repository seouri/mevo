class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :book_id
      t.integer :term_id
      t.integer :page, :limit => 2
      t.integer :indent, :limit => 1
      t.string :tree_number
      t.timestamps
    end
    add_index :line_items, [:book_id, :page]
    add_index :line_items, [:term_id, :book_id]
  end

  def self.down
    drop_table :line_items
  end
end
