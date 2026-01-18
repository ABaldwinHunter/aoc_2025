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
  # track the largest 12 numbers, going from left to right
  #
  largest = []
  rejected = {}
  rejected_count = 0

  bank.each do |num|
    if largest.count == 0
      largest << num
    else
      latest = largest.last

      if num > latest && rejected_count < 3
        largest.pop

        largest << num
        rejected_count += 1
      elsif largest.length < 12
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
