-- A Virtual Machine (VM) for Arithmetic (specification)

-----------------------
-- Data types of the VM
-----------------------

-- Natural numbers
data NN = O | S NN
  deriving (Eq,Show) -- for equality and printing

-- Integers
data II = II NN NN
  deriving (Eq,Show) -- for equality and printing

-- Positive integers (to avoid dividing by 0)
data PP = I | T PP
  deriving (Eq,Show) -- for equality and printing
  
-- Rational numbers
data QQ =  QQ II PP

------------------------
-- Arithmetic on the  VM
------------------------

----------------
-- NN Arithmetic
----------------

-- add natural numbers
addN :: NN -> NN -> NN
addN O m = m
addN (S n) m = S (addN n m)

-- multiply natural numbers
multN :: NN -> NN -> NN
multN O m = O
multN (S n) m = addN (multN n m) m

----------------
-- II Arithmetic
----------------

-- Addition: (a-b)+(c-d)=(a+c)-(b+d)
addI :: II -> II -> II
addI O II m = II m
addI (S II n) II m = 

-- Multiplication: (a-b)*(c-d)=(ac+bd)-(ad+bc)
--multI :: II -> II -> II

-- Subtraction: (a-b)-(c-d)=(a+d)-(b+c)
--subtrI :: II -> II -> II

-- Negation: -(a-b)=(b-a)
--negI :: II -> II

----------------
-- QQ Arithmetic
----------------

-- add positive numbers
addP :: PP -> PP -> PP
addP I m = T m
addP (T n) m = T (addP n m)

-- multiply positive numbers
multP :: PP -> PP -> PP
multP I m = m
multP (T n) m = addP (multP n m) m

-- convert numbers of type PP to numbers of type II
ii_pp :: PP -> II
ii_pp I = II (S O) O
ii_pp (T n) = addI (S O) n

-- Addition: (a/b)+(c/d)=(ad+bc)/(bd)
--addQ :: QQ -> QQ -> QQ

-- Multiplication: (a/b)*(c/d)=(ac)/(bd)
--multQ :: QQ -> QQ -> QQ

----------------
-- Normalisation
----------------

--normalizeI :: II -> II

----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------

-- Precondition: Inputs are non-negative
--nn_int :: Integer -> NN

--int_nn :: NN->Integer

--ii_int :: Integer -> II

--int_ii :: II -> Integer

-- Precondition: Inputs are positive
--pp_int :: Integer -> PP

--int_pp :: PP->Integer

--float_qq :: QQ -> Float

------------------------------
-- Normalisation by Evaluation
------------------------------

--nbv :: II -> II

----------
-- Testing
----------
main = do
    print $ addN (S (S O)) (S O)
    print $ multN (S (S O)) (S (S (S O)))
    print $ addP (T (T I)) (T I)


