class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title, :limit => 9
      t.timestamps
    end
    add_index :books, :title
  end

  def self.down
    drop_table :books
  end
end
