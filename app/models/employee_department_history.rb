class EmployeeDepartmentHistory < ActiveRecord::Base
	set_table_name "HumanResources.EmployeeDepartmentHistory"
	set_primary_key [:BusinessEntityID, :StartDate, :DepartmentID];
# has_many o has_one ?
	belongs_to :employee, :foreign_key => "BusinessEntityID";
	belongs_to :department, :foreign_key => "DepartmentID";
	belongs_to :shift, :foreign_key => "ShiftID";
end
