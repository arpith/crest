class RenameRecipientColumn < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :messages, :recipient, :receiver
  end

  def self.down
    rename_column :messages, :receiver, :recipient
  end
end
