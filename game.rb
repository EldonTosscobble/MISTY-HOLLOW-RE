require './engine.rb'
require './map.rb'

a_map = Map.new('carriage_ride')
a_game = Engine.new(a_map)
a_game.play()
