# frozen_string_literal: true

arr = [0, 1]

while (i = arr[-2] + arr[-1]) < 100
  arr << i
end

puts arr
