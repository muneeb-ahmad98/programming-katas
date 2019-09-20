
class Player
  attr_accessor :name, :points

  def initialize(name)
    @name = name
    @points = 0
  end
  
  def add_points
    self.points += 1
  end
end

class TennisGame
  attr_accessor :player1, :player2
  
  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
  end
  
  
  def point_won_by(player)
    player.add_points
  end
  
  def score
    result = ""
    tempScore=0
    if is_equal_score?
     return equal_score
    elsif max_score?
      diff = player1.points - player2.points
      if (diff==1)
        result ="Advantage #{player1.name}"
      elsif (diff ==-1)
        result ="Advantage #{player2.name}"
      elsif (diff >=2)
        result = "Win for #{player1.name}"
      else
        result ="Win for #{player2.name}"
      end
    else
      (1...3).each do |i|
        if (i==1)
          tempScore = player1.points
        else
          result +="-"
          tempScore = player2.points
        end
        result += {
            0 => "Love",
            1 => "Fifteen",
            2 => "Thirty",
            3 => "Forty",
        }[tempScore]
      end
    end
    result
  end
  
  def equal_score
    {
      0 => "Love-All",
      1 => "Fifteen-All",
      2 => "Thirty-All",
    }.fetch(player1.points, "Deuce")
  end
  
  def is_equal_score?
    player1.points == player2.points
  end

  def max_score?
    player1.points >= 4 or player2.points >= 4
  end
end
