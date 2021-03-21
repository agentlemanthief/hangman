# Module containing display elements for the hangman game
# frozen_string_literal: true

module HangmanDisplay
  INTRO = <<~'INTRO'
    /\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\
    \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/

      Welcome to Hangman.

      Hangman is traditionally a paper and pencil guessing game for two or more
      players. One player thinks of a word, phrase or sentence and the others
      try to guess it by suggesting letters within a certain number of guesses.

      This version has you, the player, pitted against the computer which will
      randomly choose a word to be guessed.

      Each incorrect guess adds an element to the Hangman diagram, when the
      diagram is complete the game is over.

      You can save your game by typing 'save' so that you can carry on where you
      left off next time.

      Good luck.

      Press any key to continue...

    /\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\
    \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/
  INTRO

  HANGMAN_ZERO = %q(
    _________
    |/      |
    |
    |
    |
    |
    |
    |\____
  )

  HANGMAN_ONE = %q{
    _________
    |/      |
    |      (_)
    |
    |
    |
    |
    |\____
  }
  HANGMAN_TWO = %q{
    _________
    |/      |
    |      (_)
    |       |
    |       |
    |
    |
    |\____
  }
  HANGMAN_THREE = %q{
    _________
    |/      |
    |      (_)
    |      \|
    |       |
    |
    |
    |\____
  }
  HANGMAN_FOUR = %q{
    _________
    |/      |
    |      (_)
    |      \|/
    |       |
    |
    |
    |\____
  }
  HANGMAN_FIVE = %q{
    _________
    |/      |
    |      (_)
    |      \|/
    |       |
    |      /
    |
    |\____
  }

  HANGMAN_SIX = %q{
    _________
    |/      |
    |      (_)
    |      \|/
    |       |
    |      / \
    |
    |\____
  }
end
