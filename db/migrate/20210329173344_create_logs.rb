class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.integer :user_id, null:false
      
      t.integer :calories, null:false
      t.boolean :intake, null:false
      t.timestamp :date, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.string :description
      t.float :protein
      t.float :carb
      t.float :fat
      t.float :alcochol

      t.timestamps
    end
  end
end
