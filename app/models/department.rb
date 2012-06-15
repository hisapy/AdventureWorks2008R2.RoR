class Department < ActiveRecord::Base
    self.table_name = "HumanResources.Department"
    self.primary_key = :DepartmentID
end
