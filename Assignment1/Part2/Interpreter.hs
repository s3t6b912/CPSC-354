module Interpreter where

import AbsNumbers

eval :: Exp -> Integer
eval (Num n) = n
eval (Plus n m) = (eval n) + (eval m)
eval (Times n m) = (eval n) * (eval m)
eval (Minus n m) = (eval n) - (eval m)
eval (Neg n) = negate(eval n)
eval (Div n m) = div (eval n) (eval m)
eval (Exp n m) = (eval n) ^ (eval m)
eval (Abs n) = abs(eval n)
eval (Mod n m) = (eval n) `mod` (eval m)
