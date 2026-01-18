# INPUT = 'input.txt'
INPUT = 'sample.txt'

# need to find the biggest 12 digit number
# in another form, we want to dismiss the three smallest numbers
#
# maybe the three lowest starting from the left
#


banks = File.read(INPUT).split("\n").map { |bank| bank.split("").map(&:to_i) } # [ [1, 2, 3], [4, 7, ] ] ...
BANK_LENGTH = banks.first.length
BANK_LAST_INDEX = BANK_LENGTH - 1

results = []

banks.each do |bank|
  # track the largest 12 numbers, going from left to right
  #
  largest = []

  bank.each.with_index do |num, i|
    if largest.count < 12
      largest << num
    else
      # if greater than all up to a certain point
      # and still enough after for
      #
      # check how far back to go

      last_index = largest.length - 1

      idx = last_index
      number_to_go_back = 0
      space_between_num_and_the_end = (BANK_LAST_INDEX - i)
      largest_length = largest.length

      while idx >= 0 && ((largest_length - number_to_go_back) + space_between_num_and_the_end) > 12) # we need at least 12
        latest_large_num_to_check = largest[idx]

        if latest_large_num_to_check < num
          number_to_go_back += 1
          idx -= 1
        else
          break
        end
      end

      if number_to_go_back > 0
        largest = largest[0..(last_index - number_to_go_back)]
        largest << num
      end
    end
  end

  obj = {}

  obj["original"] = bank
  obj["selected"] = largest
  obj["answer"] = largest.map(&:to_s).join("").to_i

  results << obj
end

puts "results"
puts results

puts results.map { |o| o["answer"] }.sum

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
