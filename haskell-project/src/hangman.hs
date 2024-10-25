module Main where
import System.IO
import Control.Monad (when)

main :: IO ()
main = do
    putStrLn "Welcome to Hangman!"
    putStrLn "Enter a word: "
    word <- getLine
    putStrLn "Let's start guessing!"
    gameLoop word []

gameLoop :: String -> [Char] -> IO ()
gameLoop word guesses = do
    putStrLn $ "Current guesses: " ++ guesses
    putStrLn $ "Word: " ++ map (\c -> if c `elem` guesses then c else '*') word
    putStrLn "Enter a guess: "
    guess <- getLine
    let newGuesses = guess ++ guesses
    let correctGuess = all (`elem` newGuesses) word
    let incorrectGuesses = length $ filter (`notElem` word) newGuesses
    let result = if correctGuess then "You guessed it!" else "Try again!"
    putStrLn result
    drawHangman incorrectGuesses
    if correctGuess || incorrectGuesses >= 6
        then putStrLn "Game Over!"
        else gameLoop word newGuesses

drawHangman :: Int -> IO ()
drawHangman incorrectGuesses = putStrLn $ hangmanArt incorrectGuesses

hangmanArt :: Int -> String
hangmanArt n = case n of
    0 -> "  +---+\n      |\n      |\n      |\n     ==="
    1 -> "  +---+\n  O   |\n      |\n      |\n     ==="
    2 -> "  +---+\n  O   |\n  |   |\n      |\n     ==="
    3 -> "  +---+\n  O   |\n /|   |\n      |\n     ==="
    4 -> "  +---+\n  O   |\n /|\\  |\n      |\n     ==="
    5 -> "  +---+\n  O   |\n /|\\  |\n /    |\n     ==="
    6 -> "  +---+\n  O   |\n /|\\  |\n / \\  |\n     ==="
    _ -> "Game Over!"