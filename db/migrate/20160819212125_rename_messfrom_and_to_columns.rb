class RenameMessfromAndToColumns < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :messages, :from, :sender
    rename_column :messages, :to, :recipient
  end

  def self.down
    rename_column :messages, :sender, :from
    rename_column :messages, :recipient, :to
  end
end
