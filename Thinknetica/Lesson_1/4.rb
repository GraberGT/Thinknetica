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

if d < 0
  puts 'koren net'

elsif d == 0
  x = -b / 2 * a
  puts "1 koren: x = #{x}"

else
  x1 = (-b + Math.sqrt(d)) / 2 * a
  x2 = (-b - Math.sqrt(d)) / 2 * a
  puts "2 koren : x1 = #{x1}, x2 = #{x2}"

end