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
  # okay first brute force
  # walk through and find each spot
  #
  #
  #
  new_num = []

  digits_added = 0

  used_indices = []

  while digits_reviewed < bank.length do
    # find the biggest most left unused one
    biggest = 0
    biggest_index = 0
    found_one = false

    bank.each.with_index do |num, index|
      if num > biggest && !used_indices.include?(index)
        biggest = num
        biggest_index = index
        found_one = true
      end
    end

    if found_one
      new_num << biggest
      used_indices << biggest_index
    end

    digits_reviewed += 1
  end

  new_num.map(&:to_s).join("").to_i
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
