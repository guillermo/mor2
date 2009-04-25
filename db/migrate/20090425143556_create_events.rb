class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :email, :null=>false
      t.string :name, :null=>false
      t.string :street, :null=>false
      t.string :dates, :limit=>2000
      
      t.timestamps

    end
  end

  def self.down
    drop_table :events
  end
end
