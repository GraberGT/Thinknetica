# frozen_string_literal: true

puts 'Input a'
a = gets.chomp.to_f
puts a

puts 'Input b'
b = gets.chomp.to_f
puts b

puts 'Input c'
c = gets.chomp.to_f
puts c

d = b**2 - 4 * a * c
puts d

if d.negative?
  puts 'not have root'

elsif d.zero?
  x = -b / 2 * a
  puts "1 root: x = #{x}"

elsif  x1 = (-b + Math.sqrt(d)) / 2 * a
  x2 = (-b - Math.sqrt(d)) / 2 * a
  puts "2 root : x1 = #{x1}, x2 = #{x2}"

end
