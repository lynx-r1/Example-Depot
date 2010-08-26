class AddDateToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :date, :text
  end

  def self.down
    remove_column :posts, :date
  end
end
