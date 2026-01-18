# INPUT = 'input.txt'
INPUT = 'sample.txt'

# need to find the biggest 12 digit number
# in another form, we want to dismiss the three smallest numbers
#
# maybe the three lowest starting from the left
#


banks = File.read(INPUT).split("\n").map { |bank| bank.split("").map(&:to_i) } # [ [1, 2, 3], [4, 7, ] ] ...
BANK_LAST_INDEX = banks.first.length - 1

results = []

banks.each do |bank|
  # check for ones that are the smallest three to the left
  #

  ones_to_skip = {} # val => index

  # walk through and see which should be skipped.
  #
  # if there are none to skip, put yourself
  #
  # if you are a lower number than one of the other ones to skip and
  # adjacent, then switch

  bank.each.with_index do |num, i|
    if ones_to_skip.keys.length < 3
      ones_to_skip[num] = i # default to skipping
    else
      # check if a better candidate than the others
      # if all the others are less, then definitely not a good candidate
      #

      copy = ones_to_skip.dup

      puts "copy"
      puts copy

      # walk through the copy to see if any to replace, from right to left
      # :wq

      copy.each do |key_num, val_index|
        next if key_num < num

        if i - val_index == 1 # 1 adjacent - need a way to check that :
          ones_to_skip.delete(key_num)

          ones_to_skip[num] = i
        end
      end
    end
  end

  # going to add the skipped, original number, and final number to results
  # in an object
  # so that it's easier to debug later
  #

  answer = []

  bank.each.with_index do |num, i|
    answer << num unless ones_to_skip.values.include? i
  end

  answer = answer.map(&:to_s).join("").to_i

  puts "answer is"
  puts answer

  obj = {}

  obj["original"] = bank
  obj["skipped"] = ones_to_skip
  obj["answer"] = answer

  results << obj
end

puts "results"
puts results

puts results.map { |o| o["answer"] }.sum
