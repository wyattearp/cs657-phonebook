class ExtendEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :address1, :string
    add_column :entries, :address2, :string
    add_column :entries, :city, :string
    add_column :entries, :state, :string
    add_column :entries, :zip, :string
  end

  def self.down
    remove_column :entries, :removeress1
    remove_column :entries, :removeress2
    remove_column :entries, :city
    remove_column :entries, :state
    remove_column :entries, :zip
  end
end
