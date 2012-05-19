class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :BusinessEntityID
      t.string :NationalIDNumber
      t.string :LoginID
      t.string :OrganizationNode
      t.integer :OrganizationLevel
      t.string :JobTitle
      t.date :BirthDate
      t.string :MaritalStatus
      t.string :Gender
      t.date :HireDate
      t.boolean :SalariedFlag
      t.integer :VacationHours
      t.integer :SickLeaveHours
      t.boolean :CurrentFlag
      t.string :rowguid
      t.datetime :ModifiedDate

      t.timestamps
    end
  end
end
