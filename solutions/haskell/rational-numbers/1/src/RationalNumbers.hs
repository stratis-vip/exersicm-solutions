module RationalNumbers
  ( Rational
  , abs
  , numerator
  , denominator
  , add
  , sub
  , mul
  , div
  , pow
  , expRational
  , expReal
  , rational
  ) where

import Prelude hiding (Rational, abs, div)

-- Data definition -------------------------------------------------------------
data Rational a =
  Rational a a
  deriving (Eq, Show)

rational :: Integral a => (a, a) -> Rational a
rational (x, y)
  | y == 0 = error "no zero demnominator"
  | x < 0 && y < 0 = Rational (-x') (-y')
  | x > 0 && y < 0 = Rational (-x') (-y')
  | otherwise = Rational x' y'
  where
    (x', y') = reduce (x, y)

reduce :: Integral a => (a, a) -> (a, a)
reduce (x, y) =
  let d = gcd x y
   in (fst $ divMod x d, fst $ divMod y d)

-- unary operators -------------------------------------------------------------
abs :: Integral a => Rational a -> Rational a
abs (Rational a b) =
  let a' =
        if a < 0
          then (-a)
          else a
   in rational (a', b)

numerator :: Integral a => Rational a -> a
numerator (Rational x _) = x

denominator :: Integral a => Rational a -> a
denominator (Rational _ x) = x

-- binary operators ------------------------------------------------------------
add :: Integral a => Rational a -> Rational a -> Rational a
add (Rational a1 b1) (Rational a2 b2) = rational (a1 * b2 + a2 * b1, b1 * b2)

sub :: Integral a => Rational a -> Rational a -> Rational a
sub (Rational a1 b1) (Rational a2 b2) = rational (a1 * b2 - a2 * b1, b1 * b2)

mul :: Integral a => Rational a -> Rational a -> Rational a
mul (Rational a1 b1) (Rational a2 b2) = rational (a1 * a2, b1 * b2)

div :: Integral a => Rational a -> Rational a -> Rational a
div _ (Rational 0 _) = error "Divide by zero"
div (Rational a1 b1) (Rational a2 b2) = rational (a1 * b2, b1 * a2)

pow :: Integral a => Rational a -> a -> Rational a
pow (Rational x y) n
  | n < 0 = rational (y ^ m, x ^ m)
  | otherwise = rational (x ^ n, y ^ n)
  where
    m = -n

expRational :: (Integral a, Floating b) => Rational a -> b -> b
expRational (Rational x y) n = ((fromIntegral x) ** n) / ((fromIntegral y) ** n)

expReal :: (Floating a, Integral b) => a -> Rational b -> a
expReal x (Rational a b) = root (x ** (fromIntegral a)) (fromIntegral b)

root :: Floating a => a -> a -> a
root p q = p ** (1 / q)
