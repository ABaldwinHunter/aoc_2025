# day 4
#

# file = 'input.txt'
file = 'sample.txt'

rows = File.read(file).split("\n")

grid = rows.map { |row| row.split("") }

puts "grid is"
pp grid

# some options - we could walk the grid and check neighbors
# or we could build the neighbors first, then ask each cell for
# its neighbors
#

curr_row = 0
curr_col = 0

LOWER_BOUND_COL_INDEX = rows.count - 1
RIGHT_BOUND_COL_INDEX = rows.first.length - 1

def get_neighbors(row, col)
  # 8 potential
  #
  east = col + 1
  west = col - 1
  north = row - 1
  south = row + 1

  inbound = []

  inbound << [row, east] unless east > RIGHT_BOUND_COL_INDEX
  inbound << [row, west] unless west < 0
  inbound << [north, col] unless north < 0
  inbound << [south, col] unless south > LOWER_BOUND_COL_INDEX

  inbound
end

target_count = 0

grid.each.with_index do |row, i|
  row.each.with_index do |col, j|
    neighbor_coords = get_neighbors(i, j)

    roll_count = 0

    neighbor_coords.each do |coords|
      neighbor = grid[coords.first][coords.last]
      if neighbor == "@"
        roll_count += 1
      end
    end

    if roll_count < 4
      target_count += 1
    end
  end
end

puts "answer is"
pp target_count

