class Employee < ActiveRecord::Base
  set_table_name "HumanResources.Employee"
  set_primary_key :BusinessEntityID
  
  def parseOrganizationNode()
    self.OrganizationNode.inspect
  end
end
