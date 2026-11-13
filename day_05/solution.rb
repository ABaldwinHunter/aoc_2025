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

ordered.each do |range|
  if last_range.nil?
    last_range = range

    fresh_count += range.size

  else
    # check if overlap
    if last_range.end >= range.begin
      added = range.end - last_range.end
      fresh_count += added
    else
      fresh_count += range.size
      last_range = range
    end
  end
end


puts "all_fresh count is #{fresh_count}"
