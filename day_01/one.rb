# part 1
#
#
INPUT_FILE = 'sample.txt'
# zeros count is 1066
# passes_0_count 6216 # too low
# INPUT_FILE = 'input.txt'

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
    passes_0_count += 1
  end
  #
  # count_zero_landing = true

  dir = turn.dir
  num = turn.num

  # if dir = left, then go left, or down
  # if dir = right, then go right, or up

  zero_passed_this_turn = false

  if dir == "L"
    new_num =  current_pointer - num

    while new_num < 0
      new_num += 100
      passes_0_count += 1
      zero_passed_this_turn = true
    end
  else
    new_num = current_pointer + num

    while new_num > 99
      new_num -= 100

      passes_0_count += 1
      zero_passed_this_turn = true
    end
  end

  # if new_num == 0 && (zero_passed_this_turn == false)
  #   passes_0_count += 1
  # end
  #
  zero_passed_last_turn = zero_passed_this_turn

  current_pointer = new_num
end

puts "running input"
# puts "zeros count is #{zeros_count}"
puts "passes_0_count #{passes_0_count}"

# 7282
# 6216 # too low
# 6643 # no
