require "./Combat Folder/Character Class/character_class.rb"

class Warrior < Character
  def initialize(health, ac, attack)
    super(health, ac, attack)
    @warclass = Warrior
  end

  def warrior_statblock()
    warrior_stats = {
      str => 18,
      dex => 14,
      con => 20,
      int => 8,
      wis => 5,
      cha => 11
    }
  end

  @@quips = {
    "You ready yourself to cleave the Rat with your Battle Axe" =>
    "You swing the axe with all your might, taking off one of the rats arms",
    "The might of your ancestors fills your soul" =>
    "You enter a rage of a thousand suns, punching a clean hole through
    the rats chest.",
    "You pull the spear from off your back, winding back to throw." =>
    "The spear launches towards the Giant Rat, impaling his hip and
    hindering his movement",
    "You grab the tomahawk from off your belt, readying to throw." =>
    "The tomahawk flies towards the giant rat, impaling him in the shoulder.",
  }



  def self.quips
    @@quips
  end

end
