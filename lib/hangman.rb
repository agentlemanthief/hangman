require_relative 'hangman_display'

# Class to contain computer methods and variables
class Computer
  include HangmanDisplay
  attr_reader :word, :lives, :word_guessed, :word_dashes, :incorrect_guesses

  def initialize(word = choose_word, incorrect_guesses = [], word_dashes = '_' *   word.length, lives = 6, word_guessed = false)
    @word = word
    @incorrect_guesses = incorrect_guesses
    @word_dashes = word_dashes
    @lives = lives
    @word_guessed = word_guessed
  end

  def choose_word
    contents = File.open('../5desk.txt', 'r') { |file| file.read }
    contents_arr = contents.split(/\r\n/)
    contents_arr.delete_if { |word| word.length < 5 || word.length > 12 }
    contents_arr[rand(contents_arr.length)].downcase
  end

  def display(lives)
    case lives
    when 6
      puts HangmanDisplay::HANGMAN_ZERO
    when 5
      puts HangmanDisplay::HANGMAN_ONE
    when 4
      puts HangmanDisplay::HANGMAN_TWO
    when 3
      puts HangmanDisplay::HANGMAN_THREE
    when 2
      puts HangmanDisplay::HANGMAN_FOUR
    when 1
      puts HangmanDisplay::HANGMAN_FIVE
    when 0
      puts HangmanDisplay::HANGMAN_SIX
    end
    puts "    #{@word_dashes}"
    puts "\n    Incorrect guesses: #{@incorrect_guesses}\n\n"
  end

  def check_guess(guess)
    if @word.include?(guess)
      @word.each_char.with_index do |char, i|
        @word_dashes[i] = char if char == guess
      end
    else
      @incorrect_guesses.push(guess)
      @lives -= 1
    end
    @word_guessed = true unless @word_dashes.include?('_')
  end
end
