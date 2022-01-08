require "./Combat Folder/combat_module.rb"
require "./Combat Folder/enemy.rb"
require "./Combat Folder/Character Class/warrior.rb"

class Scene
  include Combat
end

class CarriageRide < Scene
  def enter()
    system "clear"

    puts <<~HEREDOC
    Rushing down a misty forrest road in the backseat of a carriage,
    you ask the driver \"Excuse me could I stop to get a look around?\"
    He grunts in disbelief \"No way I'm stopping just so some city boy
    can go frolick through the forest, I've got deliveries to complete.
    Now stay in the damn cart boy.\"

    You sit quietly back in your seat, but you sense something from
    the forest is watching you. Before you fully realize what it could be,
    you see the carriage slow as it approaches town.

    The driver stops in front of the tavern, \"Alright, this is your stop.
    If you've got any questions about the place, the barkeep Ebrahm is your
    best bet. You go on now, I've got places to be!\"

    --> You have 2 choices, A) Stay in the cart
                            B) Go into the Misty Steppe

    HEREDOC

    cart_decision()
  end

  def cart_decision
    puts ""
    print '> '
    response = $stdin.gets.upcase.chomp

    case response
    when "A"
      puts "The carriage driver gets mad, and drowns you in a mud puddle"
      return 'death'


    when "B"
      puts "You safely exit the carriage, and enter the Misty Steppe"
      return 'tavern'

    when "C"
      puts "Welcome Admin"
      return 'basement'

    else
      puts 'Too bad, try again fuck face'
      cart_decision()
    end
  end
end

class Tavern < Scene

  def enter()
    puts <<~HEREDOC
    Welcome to the Misty Steppe! The finest tavern in all of Misty Hollow.
    I'm Ebrahm Vatsk, the owner of this fine establishment. How may I help you
    today?

    --> Would you like to, A) Ask about a room.
                           B) Ask for some brew.
                           C) Try to fuck.

    HEREDOC

    convo_with_ebram_first()
  end

  def convo_with_ebram_first
    puts ""
    print '> '
    response = $stdin.gets.upcase.chomp

    case response
    when "A"
      puts <<~HEREDOC
      Well I've got one fresh open.. Tell you what, if you go clear
      out my cellar, I'll give you the room on the house. I've got a
      nasty rat problem, and no time to take care of it.
      I'll even throw in some drinks on the house, what do you say?

      --> Would you like to, A) Accept the quest.
                             B) Die of autism.

      HEREDOC
      puts ""
      print '> '
      response = $stdin.gets.upcase.chomp

      case response
      when "A"
        puts "Well that's great! Just take the stairs down to the left"
        puts "and feel free to look around while you're down there!"
        return 'basement'

      when "B"
        return 'death'

      end

    when "B"
      puts "You're smelly and poor, fuck off cunt."
      return 'death'
    when "C"
      puts "Ebram viciously attacks you with his bare hands, ripping"
      puts "your chest open and pulling your guts out onto the"
      puts "tavern floor for everyone to see."
      return 'death'
    else
      puts "Input not accepted by Damcore Industries please try again"
      convo_with_ebram_first()
    end
  end
end


class Basement < Scene
  def enter()
    @rat = Rat.new(10, 10, 5)
    @character = Warrior.new(22, 15, 5)
    print "You creep "
    sleep(1.5)
    puts <<~HEREDOC
    down the rickety wooden steps into the damp cold cellar of
    the Misty Steppe. There are no lights in the basement, but you can here
    sounds of rats scattering at the sound of you coming down the stairs.

    As you light a torch to get a better look at things, you anger a giant rat
    in the middle of the room.
    HEREDOC
    sleep(7)
    puts ""
    puts "\*Metal Gear Solid surprise noise\*"
    sleep(1.5)
    puts ""
    puts "You have engaged, the rat pack!"
    sleep(2)


    battle(@character, @rat)
    sleep(2)
    puts ""


    puts <<~HEREDOC
    The rats body lies dead on the floor as you see a dimly lit tunnel ahead
    of you with more sounds of scratching rat feet. You grab a torch
    from the basement, and continue to dredge forward with the thought of a
    good nights sleep ahead.
    HEREDOC
    sleep(8)
    puts ""
    return 'tunnel'
  end
end


class Tunnel < Scene
  def enter()
    puts <<~HEREDOC
    As you walk through the damp tunnel, lighting your way by torch
    light, you begin to notice heaps of trash and village belongings.
    Most likely, the rats are using this as a place to keep what they
    steal and ravage from villagers.

    You see some piles of rotten food, some piles of small bones,
    and other piles of what seems to be relatively nice items.

    --> Would you like to, A) Continue forward through the tunnel.
                           B) Search the piles for something of value.
    HEREDOC

    tunnel_decision()
  end

  def tunnel_decision
    puts ""
    print '> '
    response = $stdin.gets.upcase.chomp

    case response
    when "A"
      puts "You continue forward, through the damp and dimly lit tunnel."
      puts "As you reach the end, you find a rickety wooden door leading"
      puts "to a cellar. You push open the door only for it to fall over."
      sleep(5)
      puts ""
      return 'cellar'

    when "B"
      puts "You search through the piles, finding mostly garbage and"
      puts "small bones, but while sifting through one of the mounds"
      puts "you seem to find what looks like an old effigy of the church."
      puts "It looks of value, so you put it in your satchel and continue forward."
      sleep(5)
      puts ""
      return 'cellar'

    else
      puts "Input not recognized"
      return 'tunnel'
    end
  end
end

class Cellar < Scene
  def enter()
    @rat = Rat.new(10, 10, 5)
    @character = Warrior.new(22, 15, 5)
    puts <<~HEREDOC
    As you enter the old cellar, you can see the wood holding up the
    ceiling beginning to rot from the constant moisture. The room is laced
    with cobwebs, and the distant sounds of rats. You begin to walk forward,
    but trip on a fallen piece of wood. The noise echoes throughout the cellar,
    down the tunnel, and as you begin to step forward a Giant Rat crawls out
    from a crack in the wall and squeals at you.

    You have engaged another Giant Rat!

    HEREDOC

    sleep (10)
    battle(@character, @rat)

    puts ""

    puts <<~HEREDOC
    The Giant Rat's body lies dead on the floor, and you feel a sense of
    relief. As you look around at the room, you see a staircase infront of you
    but you can tell the dimensions of the cellar are slightly off..
    This could be due to poor construction, but something feels weird...
    Almost like there's another living thing down there with you.


    --> Would you like to, A) Continue up the staircase.
                           B) Inspect the room.

    HEREDOC

    cellar_decision()
  end

  def cellar_decision
    puts ""
    print '> '
    response = $stdin.gets.upcase.chomp

    case response
    when "A"
      puts "You continue up the staircase to find a locked door."
      puts ""
      return 'church'
    when "B"
      puts "You search the room, running your hands up and down the walls."
      puts "As you feel around the east wall, a brick pushes inwards"
      puts "and the wall opens up into a secret chamber. "
      puts ""
      return 'secret_room'
    end

  end
end

class SecretRoom < Scene
  def enter()
    puts <<~HEREDOC
      You enter the secret room, and as you look around you notice beatiful
      old tapestries on the walls, a small altar in the middle of the room,
      and a chest hidden away in the corner. The presence you felt earlier grows
      ever stronger in the secret chamber...

      --> Would you like to, A) Search the chest.
                             B) Leave and continue up the stairs.

    HEREDOC

    secret_room_decision()
  end

  def secret_room_decision
    puts ""
    print '> '
    response = $stdin.gets.upcase.chomp

    case response
    when "A"
      puts <<~HEREDOC
      You walk towards the chest... As you approach, you feel an emanating
      power pulsing out of it, but you no longer can resist the temptation
      to open it.
      HEREDOC

      sleep (5)

      puts <<~HEREDOC
      As your hand touches the lock on the chest, it bursts open letting out
      an ear-shattering scream. You see giant teeth lining the inside of the
      chest, and a devilish tongue growing out of the center. It wraps itself
      around you, pulling you into the chest and eating you alive.
      HEREDOC

      puts ""
      sleep(2)
      return 'death'

    when "B"
      puts <<~HEREDOC
      You slowly back out of the room, feeling uneasy about what may be left
      inside... You begin your way up the stairs heading towards
      the door at the top.
      HEREDOC
      puts ""
      sleep (3)
      return 'church'
    end
  end
end


class Church < Scene
  def enter()
    puts <<~HEREDOC
    You get to the door at the top of the stairs, but find it to be locked.
    As you're rattling and pushing at the door to get it to budge, someone
    on the other side suddenly lifts the board keeping it shut and opens it.
    HEREDOC

    sleep(5)
    puts ""

    puts <<~HEREDOC
    To your surprise, you find yourself in the local church, and right infront
    of you is the priest.

    \"Who dares go within the cursed cellar of my church!\" he says.
    HEREDOC

    sleep(5)
    puts ""
    puts <<~HEREDOC
    You respond by telling him of the quest Ebram sent you on, and he thanks you
    for clearing out the Giant Rats. You think about the church effigy in your
    satchel and present it to him.
    HEREDOC
    sleep(5)
    puts ""

    puts <<~HEREDOC
    \"My goodness! How did you find this? This -insert effigy name- has been lost
    for years! Had I had this during the last coming of the mist, I would have
    been able to save the town. Thank you dear adventurer, you have truly saved
    us all.\"
    HEREDOC
    sleep(5)

    puts ""
    puts "CONGRATULATIONS, YOU HAVE COMPLETED THE MISTY HOLLOW TUTORIAL."
    sleep(1.5)
    puts "PLEASE COME BACK FOR MORE AFTER THE NEXT UPDATE."
    sleep(1.5)
    puts "THANKS FOR PLAYING!"
    sleep(12)
    system "exit"
  end
end

class Death < Scene

  @@quips = [
    "You died. Who let you play this?",
    "BEEF. It's what's for dinner, but you're dead.",
    "Beep Boop Beep Uninstalling Game... Go Outside",
    "The forecast for this weekend is, you're dead",
    "Welcome to TittyLand, no this isn't real, yes you're dead."
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
  end
end
