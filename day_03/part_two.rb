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

results = []

def get_number_from_bank(bank)
  # find the three smallest numbers starting from left
  #
  #
  smallest_nums = [
    # [], # index, number
    # [], # index, number
    # [] # index, number
  ]

  bank.each.with_index do |num, index|
    should_add = false

    if smallest_nums.length < 3
      should_add = true
    end

    if smallest_nums.any? {|num_tup| num_tup[1] > num  } # if any number is smaller AND more to left
      should_add = true
    end

    # then check the best one to replace:
    #
    if should_add
      smallest_nums.shift if smallest_nums.length >= 3
      smallest_nums << [index, num]
    end
  end

  # reconstruct the number without the smallest nums

  indices_to_skip = smallest_nums.map { |tup| tup.first } # skips 'b' (index 1) and 'd' (index 3)

  bank.reject.with_index { |_, index| indices_to_skip.include?(index) }.map(&:to_s).join("").to_i
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
