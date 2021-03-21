require 'json'
require 'io/console'
require_relative 'hangman_display'
require_relative 'hangman'

# Class that contains player methods, variables and game flow
class Game
  include HangmanDisplay

  def initialize(computer = Computer.new, round = 0)
    @computer = computer
    @round = round
  end

  def play_game
    intro if @round == 0
    while @computer.lives > 0 && @computer.word_guessed == false
      load_game if @round == 0
      @computer.display(@computer.lives)
      @computer.check_guess(get_input)
      @round += 1
    end
    @computer.display(@computer.lives)
    win_loose
  end

  def play_again
    puts 'Play again? y or n?'
    if gets.chomp == 'y'
      reset_game
      play_game
    else
      exit
    end
  end

  def win_loose
    if @computer.lives == 0
      puts "\nYou loose!\n\n"
      puts "The word was #{@computer.word}!!\n\n"
    else
      puts "You win!\n\n"
    end
  end

  def intro
    puts HangmanDisplay::INTRO
    STDIN.getch
  end

  def reset_game
    @computer = Computer.new
    @round = 0
  end

  def get_input
    puts "Please make a guess or type 'save' to save your game"
    input = gets.chomp.downcase
    while !input.match?('save') && !input.match?(/^[a-z]$/)
      puts "Please input ONE letter at a time! Try again..."
      input = gets.chomp.downcase
    end
    if input == 'save'
      save_game
      exit
    end
    while @computer.word_dashes.to_s.include?(input) || @computer.incorrect_guesses.to_s.include?(input)
      puts "You've already tried this one. Try again..."
      input = gets.chomp.downcase
    end
    input
  end

  def save_game
    File.open('save_game.json', 'w') do |file|
      file.puts(computer_to_json)
    end
  end

  def computer_to_json
    JSON.dump ({
      :word => @computer.word,
      :incorrect_guesses => @computer.incorrect_guesses,
      :word_dashes => @computer.word_dashes,
      :lives => @computer.lives,
      :word_guessed => @computer.word_guessed
    })
  end

  def from_json(save_game)
    computer_data = JSON.load save_game
    @computer = Computer.new(computer_data['word'], computer_data['incorrect_guesses'], computer_data['word_dashes'], computer_data['lives'], computer_data['word_guessed'])
  end

  def load_game
    if File.exist?('save_game.json')
      puts 'Would you like to continue where you left off last time? (Enter: "y" or "n")'
      answer = gets.chomp.downcase
      if answer == 'y'
        File.open('save_game.json', 'r') do |file|
          from_json(file)
        end
        File.delete('save_game.json')
      else
        return
      end
    end
  end
end

Game.new.play_game
