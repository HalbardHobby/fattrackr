class CreateTrackers < ActiveRecord::Migration[6.1]
  def change
    create_table :trackers do |t|
      t.integer :calories
      t.boolean :intake
      t.timestamp :date
      t.string :description
      t.float :protein
      t.float :carb
      t.float :fat
      t.float :alcochol

      t.timestamps
    end
  end
end
