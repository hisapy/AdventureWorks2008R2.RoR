class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :Name
      t.string :GroupName
      t.datetime :ModifiedDate

      t.timestamps
    end
  end
end
