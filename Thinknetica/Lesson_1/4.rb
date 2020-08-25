# frozen_string_literal: true

puts 'Input a, b, c'
a = gets.to_f
b = gets.to_f
c = gets.to_f

d = b**2 - 4 * a * c

d_sqrt = Math.sqrt(d)

puts d.to_s

if d >= 0
  x1 = (-b + d_sqrt) / (2 * a)
  if d > 0
    x2 = (-b - d_sqrt) / (2 * a)
    puts "#{x1}, #{x2} - roots"
  else
    puts "#{x1} - root"
  end
else
  puts 'Not have roots'
end
