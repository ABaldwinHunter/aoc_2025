# need to read in file
# grab ranges
# i think we should condense and order them
# then grab number to check
#

# file = "sample.txt"
file = "input.txt"
#

contents = File.read(file).split("\n\n") # top is ranges, bottom is ingredients

ranges = contents.first.split("\n").map { |rang| rang.split("-").map(&:to_i) }.map { |pair| Range.new(pair[0], pair[1]) } #  Range.new(0,2)

ingredients = contents.last.split("\n").map(&:to_i)

fresh_count = 0

ingredients.each do |i|
  fresh_count += 1 if ranges.any? { |r| r.include? i }
end

puts "fresh_count #{fresh_count}"
