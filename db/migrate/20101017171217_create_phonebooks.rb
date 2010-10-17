class CreatePhonebooks < ActiveRecord::Migration
  def self.up
    create_table :phonebooks do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :phonebooks
  end
end
