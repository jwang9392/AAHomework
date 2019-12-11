require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "GAME START"

    until game_over
      self.take_turn
    end

    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    #sleep(3)
    system("clear")
    #sleep(2)
    self.require_sequence
    self.round_success_message
    @sequence_length += 1
  end

  def show_sequence
    self.add_random_color
    puts "This is the current sequence"

  end

  def require_sequence
    puts "Please enter the sequence"
 
    seq.each do |color|
      puts color
      # sleep(1)
      # system("clear")
      response = gets.chomp
      unless color == response
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You matched the sequence! Congratulations"
  end

  def game_over_message
    unless game_over
      puts "That sequence is incorrect. Game over"
    end
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
