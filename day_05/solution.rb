# need to read in file
# grab ranges
# i think we should condense and order them
# then grab number to check
#

# file = "sample.txt"
file = "input.txt"
#
#
require 'set'

contents = File.read(file).split("\n\n") # top is ranges, bottom is ingredients

ranges = contents.first.split("\n").map { |rang| rang.split("-").map(&:to_i) }.map { |pair| Range.new(pair[0], pair[1]) } #  Range.new(0,2)

ingredients = contents.last.split("\n").map(&:to_i)

fresh_count = 0

# ingredients.each do |i|
#   fresh_count += 1 if ranges.any? { |r| r.include? i }
# end

# puts "fresh_count #{fresh_count}"
#

# now, we can't just take the total in the ranges, we need to merge the ranges or track all nums
#
#
# in ruby , we can add multiples to a set and the dupe is ignored and does not raise and error
#
# all_fresh = Set()

# total = ranges.count
# puts "ranges #{ranges.count} total"

# puts "starting"

# done = 0

# ranges.each do |r|
#   puts "set #{all_fresh}"
#   puts "#{done} / #{total}"
#   # r.each { |ingredient| all_fresh.add(ingredient) }

#   # all_fresh.merge(r.to_set)


#   done += 1
# end

# puts "all_fresh count is #{all_fresh.size}"
#
# first order the ranges
ordered = ranges.sort_by { |r| r.begin }
last_range = nil

# merge_them
#
merged_ranges = []

# start = ordered.first.begin # lowest number

curr_start = nil
curr_end = nil

puts "got to ordered loop"

count = 0

ordered.each do |range|
  puts "count is #{count}/#{ordered.count}"

  if curr_start.nil?
    curr_start = range.begin
    curr_end = range.end
  else
    if range.begin > curr_end
      merged_ranges << [curr_start, curr_end]

      curr_start = range.begin
      curr_end = range.end
    else
      curr_end = [curr_end, range.end].max
    end
  end

  count += 1
end

if merged_ranges.last.last != curr_end
  merged_ranges << [curr_start, curr_end]
end

# then go through and sum
#
# fresh_count = merged_ranges.sum { |r| Range.new(r.first, r.last).count } # SO SLOW
#

merged_ranges.each do |r|
  # inclusive
  # 1,3 => 1,2,3 -> so 3-1 = 2; but if it was just 1, then 1
  if r.first == r.last
    fresh_count += 1
  elsif r.last - r.first == 1
    fresh_count += 2
  else
    fresh_count += ((r.last - r.first) + 1)
  end
end

puts "Fresh count is #{fresh_count}"
