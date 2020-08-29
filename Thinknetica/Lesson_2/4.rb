# frozen_string_literal: true

alphabet = ('a'..'z').each.to_a

vowels = %w[a e i o u y]

result = {}

alphabet.each.with_index(1) do |letter, index|
  result[letter] = index if vowels.include? letter
end

puts result
