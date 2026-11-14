# file = 'sample.txt'
file = 'input.txt'

lines = File.read(file).split("\n")

# next, we need to split the lines into columns by white space, into a 2D grid kind of structure i guess;
# or potentially get the operation at the bottom first, and as we add items from that col, just do the update, don't worry about building
# giant arrays
#
operations = lines.pop

operations = operations.split(" ")

# part 1
# lines = lines.map { |line| line.split(" ").map(&:to_i) }

# results = lines.shift # start with first line

# # puts "results are"
# # pp results

# # puts "lines is"
# # pp lines
# #
# # # part 1

# lines.each do |line|
#   line.each.with_index do |num, index|
#     operation = operations[index]
#     so_far = results[index]

#     new_value = so_far.send(operation, num)

#     results[index] = new_value
#   end
# end

# now part 2 - operations are same
# but for nums, split on "" and then walk the columns of the whole 2D array
#
#
lines = lines.map { |line| line.split("") } # preserves individual spaces

results = operations.map do |op|
  if op == "*"
    1
  else
    0
  end
end # default starters for sum and multiply

line_lengths = lines.map { |line| line.count }.uniq
max_length = line_lengths.max


lines.each do |line|
  while line.length < max_length
    line << " "
  end # pad; it seems like the ones that end in white space sometimes get cut off
end

total_cols = lines.first.size

# line_lengths = lines.map { |line| line.count }.uniq
# puts "line lengths is #{line_lengths}"

last_index = total_cols - 1

curr_index  = last_index
result_index = operations.length - 1 # start at end

while curr_index >= 0 do
  # find the number and apply it to the correct operation bucket
  num = ""

  lines.each do |line|
    num += line[curr_index]
  end

  # if all are blank spaces, then we have finished the last number and can move on
  stripped = num.gsub(" ", "")

  if stripped == ""
    result_index -= 1 # because moving right to left
  else
    # else, process the vertical number
    vertical_num = stripped.to_i

    puts "vertical num is #{vertical_num}"

    operation = operations[result_index]

    so_far = results[result_index]
    new_value = so_far.send(operation, vertical_num)

    results[result_index] = new_value
  end

  curr_index -= 1
end

total = results.sum

puts "total is #{total}"

# 10603075272972 --> too low
