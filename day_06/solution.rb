file = 'sample.txt'
file = 'input.txt'

lines = File.read(file).split("\n")

# next, we need to split the lines into columns by white space, into a 2D grid kind of structure i guess;
# or potentially get the operation at the bottom first, and as we add items from that col, just do the update, don't worry about building
# giant arrays
#
operations = lines.pop

operations = operations.split(" ")

lines = lines.map { |line| line.split(" ").map(&:to_i) }

results = lines.shift # start with first line

puts "results are"
pp results

puts "lines is"
pp lines

lines.each do |line|
  line.each.with_index do |num, index|
    operation = operations[index]
    so_far = results[index]

    new_value = so_far.send(operation, num)

    results[index] = new_value
  end
end

total = results.sum

puts "total is #{total}"

