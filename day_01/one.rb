# part 1
#
# INPUT_FILE = 'sample.txt'
# zeros count is 1066
# passes_0_count 6216 # too low 6111 6211 6216
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

passes_0_count = 0
current_pointer = 50

turns.each do |turn|
  puts "current pointer #{current_pointer}"
  puts "turn: #{turn.dir} #{turn.num}"

  dir = turn.dir
  num = turn.num

  turns_without_moving = num / 100

  passes_0_count += turns_without_moving

  actual_turn = num % 100

  if dir == "L"
    new_num =  current_pointer - actual_turn

    if new_num < 0
      new_num = new_num + 100
      passes_0_count += 1
    end
  else
    new_num = current_pointer + actual_turn

    if new_num > 99
      new_num = new_num - 100
      passes_0_count += 1
    end
  end

  current_pointer = new_num
end

puts "running input"
puts "passes_0_count #{passes_0_count}"

# 7282
# 6216 # too low
# 6643 # no
# 6019 # no
# sahar answer: 5978
# current: 5984
# current: 5874
# 5987
