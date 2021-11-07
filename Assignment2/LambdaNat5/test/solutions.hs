mymember :: Eq a => a -> [a] -> Bool
mymember elem list = if elem == head(list) then True else if length(list) == 1 then False else mymember (elem) (tail(list))

myremove :: Eq a => a -> [a] -> [a]
myremove elem list = if elem == head(list) then tail(list) else if length(list) == 1 then list else head(list) : myremove (elem) (tail(list))

mysum :: [Integer] -> Integer
mysum list = if length(list) == 1 then head(list) else head(list)+(mysum (tail(list)))

myprod :: [Integer] -> Integer
myprod list = if length(list) == 1 then head(list) else head(list)*(myprod (tail(list)))

myplus_two :: Integer -> Integer
myplus_two a = a+2

mymap :: (a -> a) -> [a] -> [a]
mymap func list = if length(list) == 1 then [func (head(list))] else func (head(list)) : mymap (func) (tail(list))

main = do
    let a = [2,3,1]
    let b = [1,2,3,1,2,3]
    let c = [1,2,3,4]
    print $ mymember (1) (a)
    print $ myremove (2) (b)
    print $ mysum (c)
    print $ myprod (c)
    print $ mymap (myplus_two) (c)
