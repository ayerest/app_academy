require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            new_employee = Employee.new(employee_name, title)
            employees << new_employee
        else 
            raise "invalid title"
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        money_owed = @salaries[employee.title]
        if @funding >= money_owed
            employee.pay(money_owed)
            @funding -= money_owed
        else
            raise "we don't have enough funding"
        end
    end

    def payday
        employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
           sum += @salaries[employee.title]
        end
        sum / (@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, salary|
            if !(@salaries.has_key?(title))
                @salaries[title] = salary
            end
        end

        @employees += startup.employees
    
        startup.close
    end
end
