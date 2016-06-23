class Frame

  def initialize
    @rolls = []
  end
  
  def complete?(tenth_frame = false)
    retval = false
    if tenth_frame == false
      retval = (@rolls.length == 2) || ((@rolls.length == 1) && (@rolls[0] == 10)) ? true : false
    else # scenarios where tenth_frame == true?
      if (@rolls.length == 3) 
        retval = true
      elsif (@rolls.length == 2) && (@rolls[0] + @rolls[1] < 10)
        retval = true
      end
    end

    retval
  end

  def add_roll(pins) # pins is number of pins knocked down
    @rolls << pins
  end

  def strike?
    @rolls[0] == 10    
  end
  
  def spare?
    (@rolls.length == 2) && (@rolls[0] + @rolls[1] == 10)
  end

  def ball_one
    @rolls[0]
  end

  def ball_two
    @rolls[1]
  end

end
