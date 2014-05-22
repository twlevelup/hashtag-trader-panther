class CreateTestmodel < ActiveRecord::Migration
  def up
    create_table :testmodels do |t|
      t.string :name
    end
  end
 
  def down
    drop_table :testmodels
  end
end
