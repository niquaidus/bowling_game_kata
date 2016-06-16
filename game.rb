class Game
  
  # TODO remove later - debug only
  def show_rolls
    puts "\n\nRolls: #{@frames.count}"
    @frames.each do |frame|
      puts frame.inspect
    end
    puts "\n-------SCORE: #{self.score}\n\n"
  end
  
  
  def initialize
    #@score = 0
    @frames = []
  end
  
  def reset 
    # @score = 0
    @frames.clear
  end
  
  def add_roll(value)
    @frames << value
  end
  
  def score
    score = 0
    # puts "\n\n#{@frames.inspect}"
    
    (0..@frames.length - 1).step(2).each do  |index|
      if @frames[index] + @frames[index + 1] == 10
        # have a spare
        score += @frames[index] + @frames[index + 1] + @frames[index + 2]
        
        
        # puts "\n\n#{score}"
        
        
        
        
      else
        score += @frames[index] + @frames[index + 1]
      end
    end
    
    score
  end
end