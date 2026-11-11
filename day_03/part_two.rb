INPUT = 'input.txt'
# INPUT = 'sample.txt'

banks = File.read(INPUT).split("\n").map { |bank| bank.split("").map(&:to_i) }

def get_number_from_bank(bank)
  compacted = []
  amount_left_to_skip = bank.length - 12
  remaining = bank

  while compacted.length < 12
    start = -1
    start_index = 0
    curr_index = 0

    # Find the largest eligible digit
    while curr_index <= amount_left_to_skip
      num = remaining[curr_index]

      if num && num > start
        start = num
        start_index = curr_index
      end # In ties, the earlier one wins

      curr_index += 1
    end

    compacted << start

    # Subtract the number of digits skipped
    amount_left_to_skip -= start_index

    # Continue after the selected digit
    next_index = start_index + 1
    remaining = remaining[next_index..-1]
  end

  nn = compacted.join.to_i
  puts "new number is #{nn}"
  puts ""
  nn
end

results = banks.map { |bank| get_number_from_bank(bank) }

puts "results"
puts results

puts results.sum
