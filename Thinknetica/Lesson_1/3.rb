# frozen_string_literal: true

puts 'Enter three sides'
a, b, c = [gets.to_i, gets.to_i, gets.to_i].sort
if a == b && b == c
  puts 'Equilateral'
elsif a == b || b == c
  puts 'Isosceles'
elsif c**2 == a**2 + b**2
  puts 'Rectangular'
else
  puts 'Arbitrary'
end
