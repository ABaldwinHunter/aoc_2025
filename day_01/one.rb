# part 1
#
#
INPUT_FILE = 'sample.txt'
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


zeros_count = 0

current_pointer = 50

turns.each do |turn|
  puts "current pointer #{current_pointer}"
  puts "turn: #{turn.dir} #{turn.num}"

  if current_pointer == 0
    zeros_count += 1
  end

  dir = turn.dir
  num = turn.num

  # if dir = left, then go left, or down
  # if dir = right, then go right, or up
  #
  if dir == "L"
    new_num =  current_pointer - num

    while new_num < 0
      new_num += 100
    end
  else
    new_num = current_pointer + num

    while new_num > 99
      new_num -= 100
    end
  end

  current_pointer = new_num
end

puts "running input"
puts "zeros count is #{zeros_count}"
