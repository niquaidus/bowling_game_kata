require './frame'

class Game

  def initialize
    #@score = 0
    @frames = []
  end
  
  def reset 
    #@score = 0
    @frames.clear
  end
  
  def add_roll(value)
    if @frames.length == 0
      @frames << Frame.new
    end
    if @frames.last.complete?
      @frames << Frame.new
    end
    @frames.last.add_roll(value)
    
  end
  
  def score
    score = 0
    @frames.each_with_index do |frame, index|
      if frame.spare?
        nextframe = @frames[index + 1]
        score += frame.ball_one + frame.ball_two + nextframe.ball_one

      elsif frame.strike?
        nextframe = @frames[index + 1]
        score += frame.ball_one + frame.ball_two + nextframe.ball_one + nextframe.ball_two

      else
        score += frame.ball_one + frame.ball_two
      end

    end
     
    


  #   (0..19).step(2).each do  |index|
  #    if @frames[index] + @frames[index + 1] == 10
  #      # have a spare
  #      score += @frames[index] + @frames[index + 1] + @frames[index + 2]
  #   elsif @frames[index] == 10
  #    else
  #      score += @frames[index] + @frames[index + 1]
  #    end
  #  end
    
    score
  end
end


