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

end
