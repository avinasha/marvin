require 'tinder'

module Marvin
  class Campfire
    def initialize(options={})
      raise "Campfire Token Required" if options[:token].nil? || options[:token].empty?
      raise "Campfire Account Required" if options[:account].nil? || options[:account].empty?
      raise "Campfire Room IDs Required" if options[:room_ids].nil? || options[:room_ids].empty?
      @connection = Tinder::Campfire.new options[:account], :token => options[:token]
      @room_ids = options[:room_ids].split(',').collect {|room_str| room_str.to_i }
    end
    
    def speak(message)
      @room_ids.each do |room_id|
        room = @connection.find_room_by_id(room_id)
        room.speak(message)
      end
    end
    
    def paste(message)
      @room_ids.each do |room_id|
        room = @connection.find_room_by_id(room_id)
        room.paste(message)
      end
    end
  end
end