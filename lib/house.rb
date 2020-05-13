require './lib/room'

class House
  attr_reader :price, :address, :rooms, :value

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @value = @price.delete("$").to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @value > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      category == room.category
    end
  end

  def area
    house_area = 0
    @rooms.each do |room|
      house_area += room.area
    end
    house_area
  end

end
