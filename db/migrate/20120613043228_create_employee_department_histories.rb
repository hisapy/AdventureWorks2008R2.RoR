class CreateEmployeeDepartmentHistories < ActiveRecord::Migration
  def change
    create_table :employee_department_histories do |t|
      t.integer :DepartmentID
      t.integer :ShiftID
      t.date :StartDate
      t.date :EndDate
      t.datetime :ModifiedDate

      t.timestamps
    end
  end
end
