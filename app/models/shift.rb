class Shift < ActiveRecord::Base
	set_table_name "HumanResources.Shift"
	set_primary_key :ShiftID
  
	has_many :employee_department_history, :foreign_key  => "ShiftID";
end
