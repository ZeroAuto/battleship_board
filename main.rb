class Board
  def initialize(fleet)
    @grid = []
    @fleet = fleet
    populate_grid
    place_all_ships
  end
  
  # i think this fits with SOLID principles
  # this single responsibilty of this class is to populate the board
  def print_grid
    @grid.each do |arr|
      puts arr.join(" ")
    end
  end

  private
  
  # this method checks the grid vertically or horizontally
  # and if the path is clear it returns true so the ship
  # can be placed
  def path_clear?(x, y, direction, ship_length)
    ship_length.times do
      if direction == 0
        if @grid[y][x] != '.'
          return false
        else
          x += 1
        end
      else
        if @grid[y][x] != '.'
          return false
        else
          y += 1
        end
      end
    end

    return true
  end

  # places a single ship on the board randomly with
  # an offset based on the random direction and length
  def place_single_ship(ship)
    direction = Random.rand(2)
    offset = ship[:length] - 1

    if direction == 0
      x = Random.rand(10 - offset)
      y = Random.rand(10)
    else
      x = Random.rand(10)
      y = Random.rand(10 - offset)
    end

    if path_clear?(x, y, direction, ship[:length])
      ship[:length].times do
        if direction == 0
          @grid[y][x] = ship[:id]
          x += 1
        else
          @grid[y][x] = ship[:id]
          y += 1
        end
      end
    else
      place_single_ship(ship)
    end
  end

  def populate_grid
    10.times do
      arr = []
      10.times do
        arr.push('.')
      end
      @grid.push(arr)
    end
  end

  def place_all_ships
    @fleet.each do |ship|
      place_single_ship(ship)
    end
  end
end

# i know that the rules are pretty consistent in battleship
# but i have an aversion to hard coding variables so i am
# passing in this data as a hash 
fleet = [
  {
    :name => 'Tug',
    :id => 'T',
    :length => 2
  },
  {
    :name => 'Destroyer',
    :id => 'D',
    :length => 3
  },
  {
    :name => 'Submarine',
    :id => 'S',
    :length => 3
  },
  {
    :name => 'Battleship',
    :id => 'B',
    :length => 4
  },
  {
    :name => 'Carrier',
    :id => 'C',
    :length => 5
  }
]

grid = Board.new(fleet)
grid.print_grid
