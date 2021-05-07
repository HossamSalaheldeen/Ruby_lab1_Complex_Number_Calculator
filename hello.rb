#!/usr/bin/ruby
class ComplexNumber
    @@times_of_add = 0
    @@times_of_multiply = 0
    @@times_of_bulk_add = 0
    @@times_of_bulk_multiply = 0
    attr_accessor :real, :imag
    
    def initialize(r,i)     # constructor method
        @real, @imag = r, i
    end

    def +(cn)       # Define + method to do complex addition
        @@times_of_add += 1
        return ComplexNumber.new(self.real + cn.real, self.imag + cn.imag)
    end

    def *(cn)       # Define * method to do complex multiplication
        @@times_of_multiply += 1
        real = self.real * cn.real - self.imag * cn.imag;
        imag = self.real * cn.imag + self.imag * cn.real;
        return ComplexNumber.new(real, imag)
    end

    def self.bulk_add(cns)  # Define bulk_add method to do complex addition for array
        @@times_of_bulk_add += 1
        result =  ComplexNumber.new(0, 0)      
        for cn in cns 
            result = (result + cn)
        end
        return result
    end

    def self.bulk_multiply(cns) # Define bulk_multiply method to do complex multiplication for array
        @@times_of_bulk_multiply += 1
        result =  ComplexNumber.new(1, 0)      
        for cn in cns 
            result = (result * cn)
        end
        return result
    end

    def self.get_stats() # Define get_stats method to get how many times the calculator used categorized by the operations types.
        puts "Total number of adds: #@@times_of_add
Total number of adds: #@@times_of_multiply
Total number of bulk adds: #@@times_of_bulk_add 
Total number of bulk multiples: #@@times_of_bulk_multiply"
    end
    
end


cn1 = ComplexNumber.new(10, 20)
cn2 = ComplexNumber.new(10, 20)
cns = []
cns << cn1
cns << cn2
add_result = cn1 + cn2
puts ("Add Result = #{add_result.real} + i#{add_result.imag}")
multiply_result = cn1 * cn2
puts ("Multiply Result = #{multiply_result.real} + i#{multiply_result.imag}")
bulk_add_result = ComplexNumber.bulk_add(cns)
puts ("Bulk Add Result = #{bulk_add_result.real} + i#{bulk_add_result.imag}")
bulk_multiply_result = ComplexNumber.bulk_multiply(cns)
puts ("Bulk Multiply Result = #{bulk_multiply_result.real} + i#{bulk_multiply_result.imag}")
ComplexNumber.get_stats()






