class CreateNodes < ActiveRecord::Migration
  def self.up
    create_table :nodes do |t|
      t.integer :book_id
      t.integer :term_id
      t.integer :page, :limit => 2
      t.integer :indent, :limit => 1
      t.string :tree_number
      t.string :normalized_tree_number
      t.timestamps
    end
    add_index :nodes, [:book_id, :tree_number]
    add_index :nodes, [:term_id, :book_id]
  end

  def self.down
    drop_table :nodes
  end
end
