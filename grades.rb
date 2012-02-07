#!/usr/bin/env ruby

class Grade
  include Comparable
  attr_reader :input
  
  def initialize input
    @input = input.capitalize    
    raise "#{@input} is not in grade format" unless @input.match(/^([A-D]{1}(\+|\-)?|F)?$/)
  end
  
  def grade_sign(input_grade) 
    if input_grade[1,1].match(/\+/)
      2
    elsif input_grade[1,1].empty? #if it's a straight letter
      1
    else
      0
    end
  end
  
  def <=>(another_grade)
      if self.input[0,1] == another_grade.input[0,1]
        if grade_sign(self.input) > grade_sign(another_grade.input)
          1
        elsif grade_sign(self.input) < grade_sign(another_grade.input)
          -1
        else
          0
        end
      elsif self.input[0,1] > another_grade.input[0,1]
        -1
      else
        1
      end
  end
end

#puts Grade.new('AB+')
# => error

#puts Grade.new('B+') > Grade.new('b+')
# => true


new_array = [Grade.new('b-'), Grade.new('A+'), Grade.new('F')].sort
new_array.each do |g|
	print g.input+" "
end
# => F, B-, A+
