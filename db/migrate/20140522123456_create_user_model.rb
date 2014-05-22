class CreateUserModel < ActiveRecord::Migration
  def up
  	create_table :users do |t|
  		t.string :name
  		t.string :email
  		t.string :password
  		t.string :cats_string
  		t.boolean :is_power_trader
  		t.boolean :is_registered
  	end
  end
 
  def down
  	drop_table :users
  end
end

