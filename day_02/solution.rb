INPUT = 'input.txt'
# INPUT = 'sample.txt'

input = File.read(INPUT).split(",")

ranges = input.map { |range| range.split("-").map { |num_str| num_str.to_i } }

invalid_ids = {} # range => [] this will let us debug more easily later

for r in ranges do
  # check for invalid ids
  #
  # we're kind of looking for a palindrome
  #
  # but, since they're numbers, maybe there's a smarter way
  #
  # 123123 for example ...
  #
  # or maybe you could do it a slowish way,
  # and be smart enough to efficiently skip
  #
  # okay to start, let's just do the palindrome way
  #
  # okay I'm gonna try to use the numbers
  #
  # okay so if you divide the number by the repeated part, it is 1001, or 10001, or 100001 depending how long
  # can iterate through each range to see
  #
  start = r.first
  fin = r.last

  for num in start..fin
    len = num.to_s.length

    next if len % 2 != 0

    test_num = ("1" + "0" * (len / 2 - 1) + "1").to_i # e.g. 10001

    is_invalid = (num % test_num) == 0

    if is_invalid
      invalid_ids[r] ||= []
      invalid_ids[r] << num
    end
  end
end

total = invalid_ids.values.flatten.sum

puts "total is #{total}"
# sample is working 1227775554
#
# part one 38437576669 - v fast as well, ms
