class Character < Creature
  def initialize(health, ac, attack)
    @health = health
    @ac = ac
    @attack = attack
    @name = "You"
  end

  def health
    return @health
  end

  def ac
    return @ac
  end

  def weapon
    return @attack
  end

end
