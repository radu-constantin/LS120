class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) ||
      (lizard? && other_move.paper?) ||
      (lizard? && other_move.spock?) ||
      (spock? && other_move.scissors?) ||
      (spock? && other_move.rock?)
    end

  def <(other_move)
   (rock? && other_move.paper?) ||
    (paper? && other_move.scissors?) ||
    (scissors? && other_move.rock?) ||
    (lizard? && other_move.rock?) ||
    (lizard? && other_move.scissors?) ||
    (spock? && other_move.lizard?) ||
    (spock? && other_move.paper?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def keep_score
    @score += 1
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!\nThe first player to reach 10 points wins!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.keep_score
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.keep_score
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "\nThe score is:\n#{human.name} => #{human.score}\n#{computer.name} => #{computer.score}\n"
    if human_won_match?
      puts "#{human.name} won 10 rounds!"
    elsif computer_won_match?
      puts "#{computer.name} won 10 rounds!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to continue? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def computer_won_match?
    return true if computer.score >= 10
  end

  def human_won_match?
    return true if human.score >= 10
  end

  def rematch
    answer = nil
    loop do
      if computer_won_match?
        puts "Do you want a rematch? (y/n)"
      else human_won_match?
        puts "Do you think you can win again?"
      end
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    if answer.downcase == 'y'
      reset_score
      return true
    end
  end

  def score_winner?
    if human.score >= 10
      return true
    elsif computer.score >= 10
      return true
    end
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      if score_winner? && rematch
        next
      elsif score_winner?
        break
      end
      break unless play_again?
    end
    display_goodbye_message  #modify so that it asks you to play again and reset score.
  end
end

RPSGame.new.play
