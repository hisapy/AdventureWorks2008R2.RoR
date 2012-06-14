class Person < ActiveRecord::Base
  set_table_name 'Person.Person'
  set_primary_key 'BusinessEntityID'

  belongs_to :employee, :foreign_key => "BusinessEntityID";
  #, :primary_key => "BusinessEntityID", :class_name => "HumanResources.Employee";
  
end
