# frozen_string_literal: true

hash = { Jan: 31, Feb: 28, Mar: 31, Ap: 30, May: 31, June: 30, July: 31, Ast: 31, Sept: 30, Oct: 31, Nov: 30, Dec: 31 }

hash.each { |key, value| puts key if value == 30 }
