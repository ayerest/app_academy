require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(string)
        @salaries.has_key?(string)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            new_employee = Employee.new(employee_name, title)
            @employees << new_employee
        else
            raise "Employee title is invalid."
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "Insufficient funding!"
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
       sum = 0
       @employees.each do |employee|
           sum += @salaries[employee.title]
       end
       sum / @employees.length * 1.0  # to get a decimal in case we need it
    end

    def close
        @employees = []
        @funding = 0
    end
    
    def acquire(startup)
        @funding += startup.funding   # self.funding won't work because we never made a setter for funding

        # merging salaries
        startup.salaries.each do |title, salary|
           if !@salaries.has_key?(title)
              @salaries[title] = salary
           end
        end

        # hire employees
        @employees += startup.employees

        # close the other startup

        startup.close()
    end

end
