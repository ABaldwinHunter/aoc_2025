# part 1
#
# INPUT_FILE = 'sample.txt'
# zeros count is 1066
# passes_0_count 6216 # too low 6111 6211
INPUT_FILE = 'input.txt'
# INPUT_FILE = 'fromsahar.txt'

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
landed_at_0_on_last_time = false

# count each time lands at 0
turns.each do |turn|
  puts "current pointer #{current_pointer}"
  puts "turn: #{turn.dir} #{turn.num}"
  zero_passed_this_turn = false

  dir = turn.dir
  num = turn.num

  if num > 99
    puts "*" * 200
  end

  if dir == "L"
    new_num =  current_pointer - num
    first_pass = true

    while new_num < 0
      # test = (landed_at_0_on_last_time && (num / 100) < 1)
      new_num += 100
      passes_0_count += 1 unless landed_at_0_on_last_time && first_pass && (num <= 100)
      first_pass = false
      puts "incrementing passes_0_count, in L loop"
      zero_passed_this_turn = true
    end
  else
    new_num = current_pointer + num

    while new_num > 99
      new_num -= 100

      passes_0_count += 1
      puts "incrementing passes_0_count, in R loop"
      zero_passed_this_turn = true
    end
  end

  current_pointer = new_num
  puts "new num is #{new_num}"
  puts "\n"

  if current_pointer == 0
    passes_0_count += 1 unless zero_passed_this_turn
    landed_at_0_on_last_time = true
  else
    # passes_0_count += 1 unless zero_passed_this_turn
    landed_at_0_on_last_time = false
  end
end

puts "running input"
puts "passes_0_count #{passes_0_count}"

# 7282
# 6216 # too low
# 6643 # no
# 6019 # no
#

# sahar answer: 5978
# current: 5984
# current: 5874
#
# 5987
