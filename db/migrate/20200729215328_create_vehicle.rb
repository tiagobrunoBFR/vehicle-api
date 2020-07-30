class CreateVehicle < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.boolean :vehicle
      t.integer :year
      t.boolean :sold
      t.text :description
      t.timestamps
    end
  end
end
