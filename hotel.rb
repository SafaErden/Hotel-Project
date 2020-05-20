require_relative "room"

class Hotel

  attr_reader :rooms
  
  def initialize (name,hash)
    @name=name
    @rooms={}
    hash.each{|k,v| @rooms[k]=Room.new(v)}
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def room_exists?(str)
    @rooms.has_key?(str)
  end

  def check_in(person,room)
    if room_exists?(room)
      if @rooms[room].add_occupant(person) 
        puts 'check in successful' 
      else
        puts 'sorry, room is full'
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    @rooms.values.any?{|v| v.available_space > 0}
  end

  def list_rooms
    @rooms.each do |k,v|
        puts "#{k} : #{v.available_space} "
    end

  end
  
end
