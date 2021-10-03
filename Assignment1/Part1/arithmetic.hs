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
  deriving (Eq,Show) -- for equality and printing

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
addI (II a b) (II c d) = II (addN a c) (addN b d)

-- Multiplication: (a-b)*(c-d)=(ac+bd)-(ad+bc)
multI :: II -> II -> II
multI (II a b) (II c d) = II (addN (multN a c) (multN b d)) (addN (multN a d) (multN b c))

-- Subtraction: (a-b)-(c-d)=(a+d)-(b+c)
subtrI :: II -> II -> II
subtrI (II a b) (II c d) = II (addN a d) (addN c b)

-- Negation: -(a-b)=(b-a)
negI :: II -> II
negI (II a b) = II (b) (a)

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
ii_pp (T n) = addI (II (S O) (O)) (ii_pp (n))

-- Addition: (a/b)+(c/d)=(ad+bc)/(bd)
addQ :: QQ -> QQ -> QQ
addQ (QQ (II a b) c) (QQ (II d e) f) = QQ (addI (multI (II (a) (b)) (ii_pp(f))) (multI (ii_pp(c)) (II (d) (e)))) (multP (c) (f))

-- Multiplication: (a/b)*(c/d)=(ac)/(bd)
multQ :: QQ -> QQ -> QQ
multQ (QQ (II a b) c) (QQ (II d e) f) = QQ (multI (II (a) (b)) (II (d) (e))) (multP (c) (f))

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
    print $ addI (II (S O) (O)) (II (S O) (O))
    print $ multI (II (S (S O)) (O)) (II (S (S O)) (O))
    print $ subtrI (II (S (S O)) (O)) (II (S (S O)) (O))
    print $ negI (II (S (S O)) (O))
    print $ multQ (QQ (II (S (S O)) (O)) I) (QQ (II (S O) (O)) I)
    print $ addQ (QQ (II (S (S O)) (O)) I) (QQ (II (S O) (O)) I)
    print $ ii_pp (T (T I))


