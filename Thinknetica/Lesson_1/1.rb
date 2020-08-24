puts "Enter your name"
name = gets.chomp

puts "Enter your heigth"
h = gets.chomp.to_i

ideal = (h - 110) * 1.15

if ideal < 0
  puts "#{name}, Your weight is optimal"
else 
  puts "#{name}, Your's ideal weight #{ideal}"
end