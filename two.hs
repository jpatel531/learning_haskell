-- The :t command examines the types of expressions

:t 'a'

-- ==> 'a' :: Char   ... this means 'has type of'

:t True -- Bool
:t "HELLO!" -- [Char]
:t (True, 'a') -- (Bool, Char)  -> each tuple has its own type.

-- Functions also have types. It is good practice (but optional) to give functions explicit type declarations, except when writing very short ones.

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

-- [Char] -> [Char] means it takes one string and returns another as a result. The [Char] type is synonymous with String

-- For a function that takes several parameters

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- Common types:

Int -- stands for integer. Usually on 32-bit machines the maximum possible Int is 2147483647 and the minimum is -2147483648.

Integer -- also stands for integer. Differences is that it is not bounded and can represent really big numbers. Int is more efficient though.

factorial :: Integer -> Integer
factorial n = product [1..n]

--factorial 50  
--30414093201713378043612608166064768844377641568960512000000000000


Float -- a real floating point with single precision

circumference 4.0  
--25.132742 


Double -- a real floating point with double the precision

circumference' :: Double -> Double  
circumference' r = 2 * pi * r 

circumference' 4.0  
--25.132741228718345 

Bool

Char

 -- Tuples are types but they are dependent on their length as well as types of compontents

 -- TYPE VARIABLES

 :t head

 -- head :: [a] -> a    ---- a is a type variable, it can be of any type.

 -- Functions that have type variables are called polymorphic functions. The type declaration of head states that it takes a list of any type and returns one element of that type

 :t fst 

 -- fst :: (a, b) -> a 

:t (==)

-- (==) :: (Eq a) => a -> a -> Bool

-- everything before the => is a class constraint. a must be of the Eq class

-- The Eq typeclass provides an interface for testing for equality. Any type where it makes sense to test for requality between values of that type should be a member of the Eq class. All standard Haskell types except for IO (the type for dealing with input output) and functions are a part of the Eq typeclass

:t elem

-- (Eq a) => a -> [a] -> Bool ----- because it uses == to over a list to check whether the value we're looking for is in it


-- Basic typeclasses:

Eq -- used for types that support equality testing. If there is an Eq class constraint fo a type variable in a function, it uses == or /= somewhere inside its definition. All types mentioned previously except for functions are a part of Eq, so they can be tested for equality

Ord 
-- :t (>)

-- (>) :: (Ord a) => a -> a -> Bool

-- all types covered so far except for functions are part of Ord. This covers all the standard comparison operators. `Ordering` is a type that can be GT, LT or EQ

"Abrakadabra" < "Zebra"

-- True

"Abrakadabra" `compare` "Zebra"

-- LT (less than)

5 `compare` 3

-- GT

Show

-- members of Show can be presented as strings. All types covered except for functions cna be thus. Most used function is:

show 3
-- "3"

show True
-- "True"

show 5.334
-- "5.334"

Read

-- opposite of Show. The `read` function takes a string and returns a type which is a member of Read

read "True" || False
-- True

read "8.2" + 3.8
-- 12.0

read "[1,2,3,4]" ++ [3]  
--[1,2,3,4,3]  

-- if you just do `read "4"` it will error out, as it does not know what we want in return. Otherwise it could deduce by the function called on it

:t read
-- read :: (Read a) => String -> a

-- To clear up the ambiguity, we can explicit type annotations:

read "5" :: Int
-- 5

read "5" :: Float
-- 5.0

read "[1,2,3,4]" :: [Int]
-- [1,2,3,4]

Enum

-- for enumerables -- we can use its types in list ranges

Bounded 

-- members have an upper and lower bound. minBound and maxBound have a type of `(Bounded a) => a` . In a sense they are polymorphic constants

minBound :: Int
-- --2147483648 

maxBound :: Char
-- '\1114111' 

maxBound :: Bool
-- True

minBound :: Bool
-- False

-- all tuples are also part of Bounded if the components are also in it

maxBound :: (Bool, Int, Char)
-- (True,2147483647,'\1114111')  

Num 
-- is a numeric typeclass. They can act like any type that is a member of the Num typeclass

:t (*)
-- (*) :: (Num a) => a -> a -> a

-- This means that `*` accepts all numbers. It takes two numbers of the same type and returns a number of that type
--  That's why (5 :: Int) * (6 :: Integer) will result in a type error whereas 5 * (6 :: Integer) will work just fine and produce an Integer because 5 can act like an Integer or an Int.

Integral 
-- only includes whole numbers. In its typeclass are Int and Integer

Floating 
-- includes float and double

--- `fromIntegral` is a useful function that takes an integral number and turns it into a more general number. Useful for dealing with both floats and integers











