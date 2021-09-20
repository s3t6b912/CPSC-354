-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module ParNumbers
  ( happyError
  , myLexer
  , pExp
  , pExp1
  , pExp2
  ) where

import Prelude

import qualified AbsNumbers
import LexNumbers

}

%name pExp Exp
%name pExp1 Exp1
%name pExp2 Exp2
-- no lexer declaration
%monad { Err } { (>>=) } { return }
%tokentype {Token}
%token
  '('      { PT _ (TS _ 1) }
  ')'      { PT _ (TS _ 2) }
  '*'      { PT _ (TS _ 3) }
  '+'      { PT _ (TS _ 4) }
  L_integ  { PT _ (TI $$)  }

%%

Integer :: { Integer }
Integer  : L_integ  { (read $1) :: Integer }

Exp :: { AbsNumbers.Exp }
Exp : Exp '+' Exp1 { AbsNumbers.Plus $1 $3 } | Exp1 { $1 }

Exp1 :: { AbsNumbers.Exp }
Exp1 : Exp1 '*' Exp2 { AbsNumbers.Times $1 $3 } | Exp2 { $1 }

Exp2 :: { AbsNumbers.Exp }
Exp2 : Integer { AbsNumbers.Num $1 } | '(' Exp ')' { $2 }

{

type Err = Either String

happyError :: [Token] -> Err a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer :: String -> [Token]
myLexer = tokens

}

