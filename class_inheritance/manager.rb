require_relative 'employee'
require 'byebug'

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def get_employees(employee)

    all_employees = []
    employee.each do |el|
      if el.class == Manager
        all_employees << el
        all_employees += get_employees(el.employees)
      else
        all_employees << el
      end
    end

     all_employees.flatten.uniq
  end

  def bonus(multiplier)
    sum = 0
    all_employees = get_employees(@employees)
    all_employees.each { |e| sum += e.salary }
    sum * multiplier
  end

end

# load 'manager.rb'
# load 'employee.rb'
# ned = Manager.new("ned", "Founder", 1000000, nil)
# darren = Manager.new("darren", "TA Manager", 78000, ned)
# shawna = Employee.new("shawna", "TA", 12000, darren)
# david = Employee.new("david", "TA", 10000, darren)
