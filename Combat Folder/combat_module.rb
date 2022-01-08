module Combat
  def battle(player, enemy)
    while player.health > 0 && enemy.health > 0
      player.attack(enemy, (player.weapon))
      puts "Current enemy HP => #{enemy.health}"
      if enemy.health > 0
        enemy.attack(player, (enemy.weapon))
        puts "Current player HP => #{player.health}"
      else
        puts "The Giant Rat is dead"
      end
    end
  end

  def attack(creature, weapon)
    @quip = combat_quips()
    puts ""
    puts array_of_quips().key(@quip)
    sleep(2.5)
    die_roll = rand(1..20)
    puts ""
    puts "#{display_name()} rolled a #{die_roll}"
    if die_roll > creature.ac
      puts "That's a hit!"
      puts @quip
      creature.take_damage(weapon)
      puts ""
    else
      puts "#{display_name()} missed"
    end
    sleep(2.5)
  end

  def display_health
    puts @health
  end

  def take_damage(weapon)
    @health = @health -  weapon
  end

  def display_name
    return @name
  end

  def warclass
    return @warclass
  end

  def array_of_quips
    return warclass.quips
  end

  def combat_quips
    return warclass.quips.values[(rand(0..warclass.quips.length - 1))]
  end
end


# weapons will be in a hash with values dictating the damage they deal
