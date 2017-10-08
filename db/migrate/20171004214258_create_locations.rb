class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :region, index:true
      t.references :company, index:true
      
      t.timestamps
    end
  end
end
