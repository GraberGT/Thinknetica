puts 'Day'
day = gets.chomp.to_i

puts 'Month'
month = gets.chomp.to_i

puts 'Year'
year = gets.chomp.to_i

days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days[1] = 29 if year % 4 == 0 || year % 400 == 0 || year % 100 != 0
result = day if month == 1

sum = days[0...(month - 1)].sum + day

puts sum