# day 4
#

file = 'input.txt'
# file = 'sample.txt'

rows = File.read(file).split("\n")

grid = rows.map { |row| row.split("") }

# puts "grid is"
# pp grid

# some options - we could walk the grid and check neighbors
# or we could build the neighbors first, then ask each cell for
# its neighbors
#

LOWER_BOUND_ROW_INDEX = rows.count - 1
RIGHT_BOUND_COL_INDEX = rows.first.length - 1

def get_neighbors(row, col)
  # 8 potential
  #
  east = col + 1
  west = col - 1
  north = row - 1
  south = row + 1

  inbound = []

  north_valid = (north >= 0)
  south_valid = (south <= LOWER_BOUND_ROW_INDEX)
  east_valid = (east <= RIGHT_BOUND_COL_INDEX)
  west_valid = (west >= 0)

  inbound << [row, east] if east_valid
  inbound << [row, west] if west_valid
  inbound << [north, col] if north_valid
  inbound << [south, col] if south_valid

  inbound << [north, east] if (east_valid && north_valid)
  inbound << [north, west] if (west_valid && north_valid)
  inbound << [south, east] if (south_valid && east_valid)
  inbound << [south, west] if (south_valid && west_valid)

  inbound
end

something_changed = false
times_nothing_changed = 0
total_removed = 0
target_marked_grid = grid.map(&:dup)

while times_nothing_changed < 2 do
  # target_count = 0
  # pp target_marked_grid
  #
  something_changed = false

  grid.each.with_index do |row, i|
    row.each.with_index do |col, j|
      me = target_marked_grid[i][j]

      next unless me == "@"

      neighbor_coords = get_neighbors(i, j)

      roll_count = 0

      neighbor_coords.each do |coords|
        neighbor = target_marked_grid[coords.first][coords.last]
        if neighbor == '@'
          roll_count += 1
        end
      end

      if roll_count < 4
        total_removed += 1
        target_marked_grid[i][j] = "."
        something_changed = true
      end
    end
  end

  if something_changed == false
    times_nothing_changed += 1
  end
end

pp "answer is"
pp total_removed

  # puts "answer is"
  # pp target_count # -- part 1

# pp target_marked_grid


# 78 for sample - too high
