module Bed
    def bed?
        "I have a bed!"
    end
end

class Vehicle
    attr_reader :speed, :year, :model
    attr_accessor :color

    @@number_of_cars = 0
    def initialize(y,c,m)
        @year = y
        @color = c
        @model = m
        @speed = 0
        @@number_of_cars += 1
    end

    def self.quantity
        @@number_of_cars
    end

    def self.gas_mileage(gallons, miles)
        "#{miles / gallons} miles per gallon of gas"
    end

    def faster(amount)
        @speed += amount
    end

    def slower(amount)
        @speed -= amount
    end

    def stop
        @speed = 0
    end

    def spray_paint=(c)
        self.color = c
    end

    def to_s
        "#{year} #{color} #{model} is traveling at #{speed}"
    end

    def age
        "Your #{self.model} is #{years_old} years old"
    end

    private
    def years_old
        Time.now.year - self.year    
    end
end

class MyCar < Vehicle
    TYPE_OF = "sedan"
end

class MyTruck < Vehicle
    TYPE_OF = "truck"
    include Bed
end

# x = MyCar.new(2015, "black", "prius")
# p MyCar.gas_mileage(10,380)
# y = MyTruck.new(2009, "white", "frontier")
# puts y.bed?
# puts x.age
# puts y.age

class Student
    def initialize(n,g)
        @name = n
        @grade = g
    end

    def better_grade_than?(other_student)
        grade > other_student.grade
    end

    protected

    def grade
        @grade
    end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)
puts "Well Done!" if bob.better_grade_than?(joe)