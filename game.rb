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
    if @frames.last.complete?(@frames.length == 10)
      @frames << Frame.new
    end
    @frames.last.add_roll(value)
    
  end
  
  def score
    score = 0
    
    @frames.each_with_index do |frame, index|
    
      # Check if a frame is a spare and handle scoring accordingly
      if frame.spare?
        if index == 9 # we're at last frame
            score += frame.ball_one + frame.ball_two + frame.ball_three
        else
            nextframe = @frames[index + 1] # need to get score from next frame
            score += frame.ball_one + frame.ball_two + nextframe.ball_one
        end
        
      # Check if a strike is rolled and handle scoring accordingly  
      elsif frame.strike?

        if index < 8          
          nextnextframe = @frames[index + 2]
          puts "NextNextFrame: #{nextnextframe.inspect}\n"
        end
        if index < 9
          nextframe = @frames[index + 1]
          puts "NextFrame: #{nextframe.inspect}\n"
        end
        
        if index == 9
          puts "Yo Yo\n" 
        end
        
        #------ Begin scoring if two or more consecutive strikes are rolled
        if nextframe.ball_one == 10 
          score += frame.ball_one + nextframe.ball_one
          if nextnextframe.ball_one != 10  
            score += nextnextframe.ball_one + nextnextframe.ball_two
          else
            score += nextnextframe.ball_one
          end   
        # End scoring if two or more consecutive strikes are rolled ------#

        # Scoring for a strike with two non-strikes in next frame    
        else   
          score += frame.ball_one + nextframe.ball_one + nextframe.ball_two 
        end
      
      # Anything that is neither a spare or a strike  
      else
        score += frame.ball_one + frame.ball_two
      end
      puts "index: #{index}\nframe: #{frame.inspect}\nB1: #{frame.ball_one}  B2: : #{frame.ball_two}\n"
      puts "Score: #{score}\n\n"
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

