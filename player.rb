MAX_HP = 20

class Player
  def initialize
    puts 'Player initialize called'
    @turn = 0
  end

  def play_turn(warrior)
    @turn += 1
    puts "------------- Turn: #{@turn}"

    if warrior.feel.empty? &&
       warrior.health < 20
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
