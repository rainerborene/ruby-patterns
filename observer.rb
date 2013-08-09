require 'observer'

class Employee
  include Observable

  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end
end

class Payroll
  def update(changed_employee)
    puts "Cut a new check for #{changed_employee.name}!"
    puts "His salary is now #{changed_employee.salary}!"
  end
end

class TaxMan
  def update(changed_employee)
    puts "Send #{changed_employee.name} a new tax bill!"
  end
end

fred = Employee.new("Fred Flintstone", "Crane Operator", 30000.0)
fred.add_observer Payroll.new
fred.add_observer TaxMan.new

# Give Fred a raise
fred.salary = 35000.0
