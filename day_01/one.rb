# part 1
#
# INPUT_FILE = 'sample.txt'
# zeros count is 1066
# passes_0_count 6216 # too low
# INPUT_FILE = 'input.txt'
INPUT_FILE = 'fromsahar.txt'

class Instruction
  attr_accessor :dir, :num

  def self.from_str(input)
    num = nil;
    dir = nil;

    if input.include? "L"
      dir = "L"
    else
      dir = "R"
    end

    num = input.split(dir).last.to_i

    new(dir: dir, num: num)
  end

  def initialize(num:, dir:)
    self.num = num
    self.dir = dir
  end
end

input = File.read(INPUT_FILE).split("\n")
turns = input.map { |instruction| Instruction.from_str(instruction) }

# zeros_count = 0 # for landings
passes_0_count = 0
current_pointer = 50
zero_passed_last_turn = false

# count each time lands at 0
turns.each do |turn|
  puts "current pointer #{current_pointer}"
  puts "turn: #{turn.dir} #{turn.num}"

  if current_pointer == 0 && zero_passed_last_turn == false
    puts "incrementing passes_0_count, in landed on 0 loop"
    passes_0_count += 1
  end

  dir = turn.dir
  num = turn.num

  zero_passed_this_turn = false
  first_time_looping = true

  if dir == "L"
    new_num =  current_pointer - num

    while new_num < 0
      new_num += 100
      passes_0_count += 1 unless (first_time_looping && current_pointer == 0) # if it's the first time, then don't
      puts "incrementing passes_0_count, in L loop"
      zero_passed_this_turn = true
      first_time_looping = false
    end
  else
    new_num = current_pointer + num

    while new_num > 99
      new_num -= 100

      passes_0_count += 1 unless (first_time_looping && current_pointer == 0) # if it's the first time, then don't
      puts "incrementing passes_0_count, in R loop"
      zero_passed_this_turn = true
      first_time_looping = false
    end
  end

  zero_passed_last_turn = zero_passed_this_turn

  current_pointer = new_num
  puts "new num is #{new_num}"
  puts "\n"
  puts "\n"
end

puts "running input"
# puts "zeros count is #{zeros_count}"
puts "passes_0_count #{passes_0_count}"

# 7282
# 6216 # too low
# 6643 # no
# 6019 # no
#

# answer: 5978
# too high 5790
