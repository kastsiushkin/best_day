class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.text :address
      t.date :time
      t.float :cost
      t.integer :hardness
      t.float :duration
      t.integer :day_id

      t.timestamps null: false
    end
  end
end
