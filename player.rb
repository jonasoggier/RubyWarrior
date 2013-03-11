class Player
 
  def initialize
    @direction = 0
  end


  def play_turn(warrior)
    if @direction == 0
        if warrior.feel(:backward).empty?
           warrior.walk!(:backward)
        elsif warrior.feel(:backward).captive?
            warrior.rescue!(:backward) 
        elsif warrior.feel(:backward).wall?
            @direction = 1
        end
    else
        if warrior.feel.empty? 
            if warrior.health<15 && warrior.health >= @health
                @direction = 0
                warrior.rest!
            else
                warrior.walk!
            end
        else
            if warrior.feel.captive?
                warrior.rescue!
            else
                warrior.attack!
            end
        end
    end

    @health = warrior.health
  end
end
