class Creature
  require_relative './combat_module.rb'
  include Combat
end


class Rat < Creature

  def initialize(health, ac, attack)
    @health = health
    @ac = ac
    @attack = attack
    @name = "The Rat"
    @warclass = Rat
  end

  @@quips = {
    "The Giant Rat gnarls forwards, lounging at your feet." =>
    "The Giant Rat manages to take a chunk out of your ankle.",
    "The Giant Rat lounges forwards with his claws" =>
    "The Giant Rat swipes your chest, leaving your scratched and bloodied.",
    "The Giant Rat conjures a bucket of boiling water" =>
    "The Giant Rat inexplicably throws boiling water at your bitch face",
    "The Giant Rat learns magic" =>
    "The Giant Rat spits a fireball towards you"
  }
  def self.quips
    @@quips
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
