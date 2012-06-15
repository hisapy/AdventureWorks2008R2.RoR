class Employee < ActiveRecord::Base
  set_table_name "HumanResources.Employee"
  set_primary_key :BusinessEntityID
  
  has_one :person, :foreign_key => "BusinessEntityID";
  has_many :employee_department_history, :foreign_key  => "BusinessEntityID";
  #belongs_to :department, :through => :employee_department_history;
  #, :primary_key => "BusinessEntityID", :class_name => "Person.Person";
  
  # Parses the OrganizationNode column to be displayed as text in the browser.
  def parseOrganizationNode()
    self.OrganizationNode.inspect
  end
end
