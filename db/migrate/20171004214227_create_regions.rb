class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.references :company, index:true


      t.timestamps
    end
  end
end
