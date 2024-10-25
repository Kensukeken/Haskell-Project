module Main where
import System.IO


main :: IO ()
main = do
    putStrLn "Welcome to Calculator!"
    putStrLn "Enter first number: "
    num1 <- getLine
    putStrLn "Enter second number: "
    num2 <- getLine
    putStrLn "Enter an operation (+, -, *, /): "
    op <- getLine
    let n1 = read num1 :: Double
        n2 = read num2 :: Double
        result = case op of
            "+" -> n1 + n2
            "-" -> n1 - n2
            "*" -> n1 * n2
            "/" -> n1 / n2
            _   -> error "Invalid operation"
    putStrLn ("The result is: " ++ show result)
    