        # Attempting to score for more than two strikes  
        elsif nextframe.ball_one == 10 && nextnextframe.ball_one == 10
          puts "Got Here!!"
          score += frame.ball_one + nextframe.ball_one + nextnextframe.ball_one
