require 'pry-byebug'

MAX_HP = 20

class Player

  def initialize
    puts '-- Player initialize called --'
    @turn = 0
    @minhealth = 20
    @lasthealth = 20
  end

  def play_turn(warrior)
    @turn += 1

    # Here's what various troubleshooting features look like

    # puts warrior.inspect
    # puts warrior.to_s
    # pp warrior

    # if @turn == 35
    #   binding.pry
    # end

    puts "Health: #{warrior.health}"

    lostHealth = false
    if warrior.health < @lasthealth
      puts "Lost health since last turn: #{@lasthealth-warrior.health}"
      lostHealth = true
    end
    @lasthealth = warrior.health

    if warrior.health < @minhealth
      @minhealth = warrior.health
    end
    puts "Min Health: #{@minhealth}"

    if warrior.feel.captive?
      warrior.rescue!
      return
    end

    if warrior.feel.empty? &&
       warrior.health < 20 &&
       !lostHealth
      warrior.rest!
      return
    end

    if warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
    end
  end
end
