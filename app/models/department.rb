class Department < ActiveRecord::Base
    set_table_name "HumanResources.Department"
	set_primary_key :DepartmentID  
	has_many :employee_department_history, :foreign_key  => "DepartmentID";
end
