class Department < ActiveRecord::Base
    self.table_name = "HumanResources.Department"
    self.primary_key = :DepartmentID
    has_many :employee_department_history, :foreign_key  => "DepartmentID";
end
