class Map
  require './scene'
  @@scenes = {
    'carriage_ride' => CarriageRide.new(),
    'tavern' => Tavern.new(),
    'basement' => Basement.new(),
    'tunnel' => Tunnel.new(),
    'cellar' => Cellar.new(),
    'church' => Church.new(),
    'secret_room' => SecretRoom.new(),
    'death' => Death.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end
