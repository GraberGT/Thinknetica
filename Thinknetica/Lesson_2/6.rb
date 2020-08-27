check = {}
sum = 0
loop do
  puts '1. Write product name'
  product = gets.chomp

  puts '2. Write price'
  price = gets.chomp.to_f

  puts '3. Write quantity'
  quantity = gets.chomp.to_f

  puts '0. Exit'
  puts '4. Add product'

  puts 'Write your choice: '
  input = gets.chomp.to_f

  check[product] = { 'price': price, 'quantity': quantity }
  break if input == 0
end

check.each { |product, hash| sum += hash['price'] * hash['quantity'] }

puts check
puts sum.to_s

