class Employee < ActiveRecord::Base
  set_table_name "HumanResources.Employee"
  set_primary_key :BusinessEntityID
  
  # Parses the OrganizationNode column to be displayed as text in the browser.
  def parseOrganizationNode()
    self.OrganizationNode.inspect
  end
end
