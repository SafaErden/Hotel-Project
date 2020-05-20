class Room

  attr_reader :capacity, :occupants

  def initialize(capacity)
    @capacity=capacity
    @occupants=[]
  end

  def full?
    @occupants.size<@capacity ? false : true
  end

  def available_space
    @capacity-self.occupants.size
  end

  def add_occupant(name)
    if !self.full?
      @occupants<<name
      return true
    end
    false
  end
end
