atIndex :: Integer -> [[Char]] -> [Char]
atIndex index list = if (index == 0) then (head list) else atIndex (index-1) (tail list)

getBlank :: Int -> [Char] -> [Char]
getBlank len list = if (len == 0) then list else getBlank (len-1) ('_' : list)

mymember :: Eq a => a -> [a] -> Bool
mymember elem list = if elem == head(list) then True else if list == [] then False else mymember (elem) (tail(list))

guessLetter :: Char -> [Char] -> [Char] -> [Char]
guessLetter letter currentWord correctWord = if currentWord == [] then [] else if letter == (head correctWord) then letter : guessLetter letter (tail currentWord) (tail correctWord) else head(currentWord) : guessLetter letter (tail currentWord) (tail correctWord)

compareWords :: Eq a => [a] -> [a] -> Bool
compareWords currentWord correctWord = if not (head(currentWord) == head(correctWord)) then False else if correctWord == [] then True else compareWords (tail(currentWord)) (tail(correctWord))

printMan :: Int -> IO()
printMan 0 = putStrLn "" >>
    putStrLn "_______" >>
    putStrLn "|     |" >>
    putStrLn "|      " >>
    putStrLn "|      " >>
    putStrLn "|      " >>
    putStrLn "|      " >>
    putStrLn "-------" >>
    putStrLn ""
printMan 1 = putStrLn "" >>
    putStrLn "_______" >>
    putStrLn "|     |" >>
    putStrLn "|     O" >>
    putStrLn "|      " >>
    putStrLn "|      " >>
    putStrLn "|      " >>
    putStrLn "-------" >>
    putStrLn ""
printMan 2 = putStrLn "" >>
    putStrLn "_______" >>
    putStrLn "|     |" >>
    putStrLn "|     O" >>
    putStrLn "|     |" >>
    putStrLn "|      " >>
    putStrLn "|      " >>
    putStrLn "-------" >>
    putStrLn ""
printMan 3 = putStrLn "" >>
    putStrLn "_______" >>
    putStrLn "|     |" >>
    putStrLn "|     O" >>
    putStrLn "|    /|" >>
    putStrLn "|      " >>
    putStrLn "|      " >>
    putStrLn "-------" >>
    putStrLn ""
printMan 4 = putStrLn "" >>
    putStrLn "_______" >>
    putStrLn "|     |" >>
    putStrLn "|     O" >>
    putStrLn "|    /|\\" >>
    putStrLn "|      " >>
    putStrLn "|      " >>
    putStrLn "-------" >>
    putStrLn ""
printMan 5 = putStrLn "" >>
    putStrLn "_______" >>
    putStrLn "|     |" >>
    putStrLn "|     O" >>
    putStrLn "|    /|\\" >>
    putStrLn "|    / " >>
    putStrLn "|      " >>
    putStrLn "-------" >>
    putStrLn ""
printMan 6 = putStrLn "" >>
    putStrLn "_______" >>
    putStrLn "|     |" >>
    putStrLn "|     O" >>
    putStrLn "|    /|\\" >>
    putStrLn "|    / \\" >>
    putStrLn "|      " >>
    putStrLn "-------" >>
    putStrLn ""

playGame :: [Char] -> [Char] -> [Char] -> IO()
playGame incorrect currentWord correctWord =
    if (length incorrect) == 6 then printMan 6
        else if (compareWords currentWord correctWord) then print $ "Congradulations! You managed to guess " ++ correctWord ++ "! Thanks for playing!"
        else do
            printMan (length incorrect)
            putStrLn (currentWord)
            putStrLn ""
            putStrLn ("Incorrect guesses: " ++ incorrect)
            putStrLn "Please guess a letter"
            temp <- getLine
            let letter = read temp :: Char
            let word = guessLetter letter currentWord correctWord
            putStrLn ""
            if (mymember letter correctWord) then playGame incorrect word correctWord else playGame (letter : incorrect) currentWord correctWord

main = do
    let wordList = [['a', 'p','p', 'l', 'e'], ['b', 'l','a', 'n', 'k', 'e', 't'], ['o', 'r', 'a', 'n', 'g', 'e'], ['p', 'r', 'o', 'g', 'r', 'a', 'm', 'm', 'i', 'n', 'g'], ['l', 'a', 'n', 'g', 'u', 'a', 'g', 'e'], ['l', 'i', 's', 't'], ['h', 'a', 's', 'k', 'e', 'l', 'l'], ['c', 'o', 'm', 'p', 'u', 't', 'e', 'r'], ['s', 'c', 'i', 'e', 'n', 'c', 'e'], ['h', 'a', 'n', 'g', 'm', 'a', 'n']]
    putStrLn "Welcome to Hang Man!"
    putStrLn ""
    putStrLn "_______"
    putStrLn "|     |"
    putStrLn "|     O"
    putStrLn "|    /|\\"
    putStrLn "|    / \\"
    putStrLn "|      "
    putStrLn "-------"
    putStrLn ""

    putStrLn "Please input a number from 0-9 to select a word to guess."
    temp <- getLine
    let selection = read temp :: Integer
    let correctWord = atIndex (selection) (wordList)
    let currentWord = getBlank (length correctWord) ([])
    putStrLn ""

    playGame [] currentWord correctWord