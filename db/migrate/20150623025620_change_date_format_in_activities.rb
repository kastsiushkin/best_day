class ChangeDateFormatInActivities < ActiveRecord::Migration
  def up
    change_column :activities, :address, :string
    change_column :activities, :time, :timestamp
  end

  def down
    change_column :activities, :address, :text
    change_column :activities, :time, :time
  end
end
