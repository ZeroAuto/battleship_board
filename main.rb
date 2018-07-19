class Board
  def initialize(fleet)
    @grid = []
    @fleet = fleet
    populate_grid
    place_all_ships
  end
  
  def print_grid
    puts @grid
    @grid.each do |arr|
      puts arr.join(" ")
    end
  end

  private
  
  def detect_ship(x, y)
  end

  def place_single_ship(ship)
    direction = Random.rand(2)
    offset = ship[:length] - 1
    x = Random.rand(10 - offset)
    y = Random.rand(10 - offset)
    @grid[y][x] = ship[:id]
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

  def generate_random_coordinates(length)
    offset = length - 1
  end
end

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
    :name => 'Cruiser',
    :id => 'C',
    :length => 4
  },
  {
    :name => 'Battleship',
    :id => 'B',
    :length => 5
  }
]

grid = Board.new(fleet)
grid.print_grid
