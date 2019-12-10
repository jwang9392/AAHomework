class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_1 = name1
    @player_2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    (0..13).each do |i|
      4.times {@cups[i] << :stone} unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (0..12).include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones_to_play = @cups[start_pos]
    @cups[start_pos] = []
    idx = start_pos

    until stones_to_play.empty?
      idx = (idx + 1) % 14

      if idx == 6
        @cups[6] << stones_to_play.pop if current_player_name == @player_1
      elsif idx == 13
        @cups[13] << stones_to_play.pop if current_player_name == @player_2
      else
        @cups[idx] << stones_to_play.pop
      end 
    end

    render
    next_turn(idx)
  end

  # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
      # helper method to determine what #make_move returns
  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups.drop(6).all? { |cup| cup.empty? }
  end

  def winner
    player_1_count = @cups[6].count
    player_2_count = @cups[13].count

    if player_1_count == player_2_count
      :draw
    else
      player_1_count > player_2_count ? @player_1 : @player_2
    end
  end
end
