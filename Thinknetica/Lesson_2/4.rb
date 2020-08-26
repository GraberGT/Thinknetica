# frozen_string_literal: true

arr = ['a'..'z']

hash = %w[a e i o u y].to_a

arr.each.with_index(1) do |key, value|
  hash[key] = value if hash.include? key
end

puts hash
