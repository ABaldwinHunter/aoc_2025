# INPUT = 'input.txt'
INPUT = 'sample.txt'

# need to find the biggest 12 digit number
# in another form, we want to dismiss the three smallest numbers that occur most to the left
#
# maybe the three lowest starting from the left
#


banks = File.read(INPUT).split("\n").map { |bank| bank.split("").map(&:to_i) } # [ [1, 2, 3], [4, 7, ] ] ...
BANK_LENGTH = banks.first.length
BANK_LAST_INDEX = BANK_LENGTH - 1

def get_number_from_bank(bank)
  # start from left, find the smallest three numbers
  # and then stop

  # first choose largest of first four numbers as the start
  #
  # then, use the same algorthm as before
  #

  compacted = []
  amount_left_to_skip = BANK_LENGTH - 12
  remaining = bank
  loops = 0

  # first come from the left, trying to skip
  # compact out all the blockers
  while amount_left_to_skip > 0 && loops <= BANK_LENGTH do
    start = 0
    start_index = 0
    curr_index = 0

    next unless remaining.length > 0

    while curr_index < amount_left_to_skip do
      num = remaining[curr_index]

      if num && num > start
        start = num
        start_index = curr_index
      end # in ties, the earlier one wins so no reset here

      curr_index += 1
    end

    compacted << start

    amount_left_to_skip -= (start_index)
    next_index = start_index + 1
    last_index = remaining.length - 1
    copy = remaining[next_index, last_index]
    remaining = copy
    loops += 1
  end

  nn = new_num.map(&:to_s).join("").to_i
  puts "new number is #{nn}"
  puts ""
  nn
end

results = banks.map { |bank| get_number_from_bank(bank) }

puts "results"
puts results

puts results.sum

# puts results.map { |o| o["answer"] }.sum

# 96208577600828
# That's not the right answer; your answer is too low.
#
#
# 96331932080234
#
#
## still too low
# 150284043173300
# 150284043173300
#
#
# latest - 406754788014470
# 411795686123770
