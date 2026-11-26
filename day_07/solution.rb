# day 7 - manifold beams
#
#
# file_path = 'input.txt'
file_path = 'sample.txt'

file = File.read(file_path)

# intuitive -> build the manifold
# # move over the space
# tracking the splits
#

manifold = file.split("\n").map { |row| row.split("") } # 2D grid

BLANK = '.'.freeze
BEAM = '|'.freeze
SPLITTER = '^'.freeze

# go row by row
# apply the logic
# and count splits as we go
#

splits = 0

curr_row_index = 0 # start at row 1
curr_col_index = 0
last_row = manifold.length - 1
last_col = manifold.first.length - 1

# prev_row_splits = []
# prev_row_beams = []
#
# part 1
# need_beam_indices = []
#
# part 2
need_beam_indices = {}

# pp manifold

# PART I
# while curr_row_index <= last_row do
#   # set col split indices for prev row
#   #
#   need_beam_indices_for_next_row = []
#   curr_col_index = 0

#   while curr_col_index <= last_col do
#     item = manifold[curr_row_index][curr_col_index]

#     if item == 'S' || item == BEAM
#       # insert intended beam for next row
#       need_beam_indices_for_next_row << curr_col_index
#     elsif item == SPLITTER && (need_beam_indices.include? curr_col_index) # only counts as a split if there was a beam intended for here
#       need_beam_indices_for_next_row << (curr_col_index - 1)
#       need_beam_indices_for_next_row << (curr_col_index + 1)
#       puts "got to split"
#       splits += 1
#     elsif item == BLANK && (need_beam_indices.include? curr_col_index)
#         manifold[curr_row_index][curr_col_index] = BEAM
#         need_beam_indices_for_next_row << curr_col_index
#       # else no need to do anything, it stays a dot
#     end

#     curr_col_index += 1
#   end

#   need_beam_indices = need_beam_indices_for_next_row

#   curr_row_index += 1
# end

# # part 1

# puts "split count is #{splits}"
#

timelines = 1 # one to start

# PART 2
while curr_row_index <= last_row do
  # set col split indices for prev row
  #
  need_beam_indices_for_next_row = {}
  curr_col_index = 0

  while curr_col_index <= last_col do
    item = manifold[curr_row_index][curr_col_index]

    if item == 'S' || item == BEAM
      # insert intended beam for next row
      need_beam_indices_for_next_row[curr_col_index] ||= 0
      need_beam_indices_for_next_row[curr_col_index] += 1
    elsif item == SPLITTER && (need_beam_indices[curr_col_index]) # only counts as a split if there was a beam intended for here
      left = (curr_col_index - 1)
      right = (curr_col_index + 1)
      need_beam_indices_for_next_row[left] ||= 0
      need_beam_indices_for_next_row[left] += 1

      need_beam_indices_for_next_row[right] ||= 0
      need_beam_indices_for_next_row[right] += 1
      puts "got to split"
      # splits += 1
    elsif item == BLANK && (need_beam_indices[curr_col_index])
        manifold[curr_row_index][curr_col_index] = BEAM
        need_beam_indices_for_next_row[curr_col_index] ||= 0
        need_beam_indices_for_next_row[curr_col_index] += 1
      # else no need to do anything, it stays a dot
    end

    curr_col_index += 1
  end

  # add the number of timelines per split?
  need_beam_indices_for_next_row.each do |col, times_hit|
    # shouldn't be a new timeline if just increasing from the last time
    next_row = times_hit

    last_row_beams_here = need_beam_indices[col] || 0

    timelines += (times_hit - last_row_beams_here)
  end

  need_beam_indices = need_beam_indices_for_next_row

  curr_row_index += 1
end

# part 1

# puts "split count is #{splits}"
#
# part 2
puts "timeline count is #{timelines}"
#
# # 3319 is too low ( 1660 * 2 - )
2 * 1660 - 2
# split_count * 2 - 1
