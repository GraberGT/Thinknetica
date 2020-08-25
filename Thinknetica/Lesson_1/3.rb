# frozen_string_literal: true

puts 'First side'
a = gets.chomp.to_i

puts 'Second side'
b = gets.chomp.to_i

puts 'Third side'
c = gets.chomp.to_i

array = [a, b, c]
hyp = array.sort![2]
k1 = array[0]
k2 = array[1]
sum = k1 + k2

right = hyp**2 == k1**2 + k2**2

if right
  puts 'This triangle is right angled'
elsif hyp && k1 == k2
  puts 'This is right angled triangle and equilaterial'
elsif (sum == hyp) && (k1 == k2 || k1 == hyp || hyp == k2)
  puts 'This is triangle with equal sides but not right angled'
else
  puts 'This is regular triangle'
end
