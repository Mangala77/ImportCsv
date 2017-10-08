class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :duration
      t.integer :price
      t.integer :location_id
      t.boolean :disabled, default:false
      t.references :company, index:true
      
      t.timestamps
    end
  end
end
