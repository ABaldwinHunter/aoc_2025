# INPUT = 'input.txt'
INPUT = 'sample.txt'

# first, find the biggest number, most left, if tie
# that is the first digit
# then, find the biggest number to right of that.
# if no number to the right of it, then the biggest number to the left
#


banks = File.read(INPUT).split("\n").map { |bank| bank.split("").map(&:to_i) } # [ [1, 2, 3], [4, 7, ] ] ...
BANK_LAST_INDEX = banks.first.length - 1

results = []

banks.each do |bank|
  first_highest = 0
  first_highest_idx = 0

  bank.each.with_index do |num, i|
    # print "number is #{num}"
    # print "index is #{i}"

    if num > first_highest
      first_highest = num
      first_highest_idx = i
    end
  end

  highest_number_last_element = (first_highest_idx == BANK_LAST_INDEX)

  # find second highest
  to_search = if highest_number_last_element
                bank[0..(first_highest_idx - 1)]
              else
                # find the highest number to the right
                bank[(first_highest_idx + 1)..BANK_LAST_INDEX] # these are all the same length so could be a constant
              end

  second = to_search.max

  result = if highest_number_last_element
             (second * 10) + first_highest
           else
             first_highest * 10 + second
           end

  results << result
end

puts results

puts results.sum
