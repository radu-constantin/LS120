class Move
  attr_accessor :name

  def to_s
    @name
  end
end

class Rock < Move
  def initialize
    @name = 'rock'
  end

  def >(other_move)
     other_move.class == Scissors || other_move.class == Lizard
  end

  def <(other_move)
    other_move.class == Paper || other_move.class == Spock
  end
end

class Paper < Move
  def initialize
    @name = 'paper'
  end

  def >(other_move)
     other_move.class == Rock || other_move.class == Spock
  end

  def <(other_move)
    other_move.class == Scissors || other_move.class == Lizard
  end
end

class Scissors < Move
  def initialize
    @name = 'scissors'
  end
  def >(other_move)
     other_move.class == Paper || other_move.class == Lizard
  end

  def <(other_move)
    other_move.class == Rock || other_move.class == Spock
  end
end

class Lizard < Move
  def initialize
    @name = 'lizard'
  end
  def >(other_move)
     other_move.class == Spock || other_move.class == Paper
  end

  def <(other_move)
    other_move.class == Rock || other_move.class == Scissors
  end
end

class Spock < Move
  def initialize
    @name = 'spock'
  end
  def >(other_move)
     other_move.class == Rock || other_move.class == Scissors
  end

  def <(other_move)
    other_move.class == Lizard || other_move.class == Paper
  end
end


class Player
  attr_accessor :move, :name, :score
  POSSIBLE_MOVES = {
    'rock' => Rock,
    'paper' => Paper,
    'scissors' => Scissors,
    'lizard' => Lizard,
    'spock' => Spock
  }

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
      break if POSSIBLE_MOVES.keys.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = POSSIBLE_MOVES[choice].new
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = POSSIBLE_MOVES[POSSIBLE_MOVES.keys.sample].new
  end
end

class History
  attr_accessor :move_history
  def initialize
    @move_history = Hash.new
  end
end

class RPSGame
  attr_accessor :human, :computer, :history, :round

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
    @round = 1
  end

  def next_round
    @round += 1
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
      true
    elsif computer.score >= 10
      true
    end
  end

  def add_to_history
    history.move_history[round] = "\nRound #{round}: \n#{human.name} chose #{human.move}.\n#{computer.name} chose #{computer.move}.\n"
  end

  def print_history
    history.move_history.each_value do |moves|
      print moves
    end
  end

  def see_history?
    answer = nil
    loop do
      puts 'Do you want to see the moves that were played this match?(y/n)'
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts 'Sorry, must be y or n.'
    end
    print_history if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      add_to_history
      display_moves
      display_winner
      display_score
      next_round
      if score_winner? && rematch
        next
      elsif score_winner?
        see_history?
        break
      end
      break unless play_again?
      system 'clear'
    end
    display_goodbye_message
  end
end

RPSGame.new.play
