class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :Name
      t.time :StartTime
      t.time :EndTime
      t.datetime :ModifiedDate

      t.timestamps
    end
  end
end
