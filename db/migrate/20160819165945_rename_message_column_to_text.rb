class RenameMessageColumnToText < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :messages, :message, :text
  end

  def self.down
    rename_column :messages, :text, :message
  end
end
