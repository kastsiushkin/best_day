class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :name
      t.text :description
      t.string :location

      t.timestamps null: false
    end
  end
end
