require './lib/room'

class House
  attr_reader :price, :address, :rooms, :value

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @value = @price.delete("$").to_f
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

  def details
    house_details = Hash.new
    house_details["price"] = @value
    house_details["address"] = @address
    house_details
  end

  def price_per_square_foot
    psf = @value / area
    psf.round(2)
  end

  def rooms_sorted_by_area
    rooms.sort {|a,b| b.area <=> a.area}
  end

end
