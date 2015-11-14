# role > ConcreteComponent
class SuperHero
  attr_reader :name

  def initialize(name)
    @name = name
    @energy = 100
  end

  def energy
    @energy
  end

  def alive?
    @energy > 0
  end

  def damage
    1
  end

  def attack(enemy)
    puts "#{name} (#{energy}) attacks #{enemy.name} (#{enemy.energy})"
    enemy.get_damage(damage)
  end

  def get_damage(amount_damage)
    @energy -= amount_damage
  end
end

# role > Decorator
module ArmedHero
  def damage
    5
  end
end

module WizardHero
  def damage
    10
  end
end

module GiantHero
  def damage
    20
  end
end

class Fight
  attr_reader :hero1, :hero2
  
  def initialize(hero1, hero2)
    @hero1 = hero1
    @hero2 = hero2
    puts "Fight: #{@hero1.name} VS #{@hero2.name}"
  end

  def start
    while @hero1.alive? && @hero2.alive?
      if rand(0..1) == 0
        @hero1.attack @hero2
      else
        @hero2.attack @hero1
      end
    end
   
    winner = @hero1.alive? ? @hero1 : @hero2
    puts "Winner: #{winner.name}"
  end
end

hero1 = SuperHero.new('Capitan America')
hero2 = SuperHero.new('IronMan').extend(ArmedHero)
fight = Fight.new(hero1, hero2)
fight.start

hero1 = SuperHero.new('Hulk').extend(GiantHero)
hero2 = SuperHero.new('Chuck Norris').extend(ArmedHero).extend(WizardHero).extend(GiantHero)
fight = Fight.new(hero1, hero2)
fight.start
