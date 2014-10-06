doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
	then x
	else x * 2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

--Lists

let lostNumbers = [4,8,15,16,23,42]

-- Declaring lists

-- lostNumbers = [4,8,15,16,23,42]

--	Adding lists and Strings

-- [1,2,3,4] ++ [5,6,7,8] equals [1,2,3,4,5,6,7,8]
-- "hello" ++ " " ++ "world" equals "hello world"

-- Prepending to lists

-- 5:[1,2,3,4,5] equals [5,1,2,3,4,5]

-- To get the element out of the list by index:

-- "Steve Buscemi" !! 6 =====> 'B'
-- [1,2,3,4,5,6] !! 2 ====> 3

-- Nested Lists

let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]] 
b ++ [[1,1,1,1]]  

-- ==> [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3],[1,1,1,1]]  

-- Comparing lists: first the first element is compared, then the next and so on

-- [3,2,1] > [2,1,0] ====> True

-- [3,4,2] > [3,4] ====> True

--- List functions

head [5,4,3,2,1]

-- => 5 returns first element

tail [5,4,3,2,1]

-- => [4,3,2,1] returns all but first

last [5,4,3,2,1]

-- => 1 returns last element

init [5,4,3,2,1]

-- => [5,4,3,2] returns all but last 

length [5,4,3,2,1]

-- 5, returns length

null [5,4,3,2,1]

-- False. checks if a list is empty

reverse [5,4,3,2,1]

-- [1,2,3,4,5] - reverses a list

take 3 [5,4,3,2,1]

-- [5,4,3] takes the first n numbers from the list and returns those taken

drop 3 [5,4,3,2,1]

-- [2,1] removes the first n elements from the list and returns the original array minus those elements

maximum [5,4,3,2,1]

-- returns largest number

minimum [5,4,3,2,1]

-- returns smallest

sum [5,4,3,2,1]

-- returns sum. 15

product [5,4,3,2,1] 

-- returns product, 120

4 `elem` [3,4,5,6]

-- True. says if that element is included in the list

--- Ranges

--- [1..20] => returns list of numbers 1 to 20
--- ['a'..'z'] ==> returns string "abcdefghijklmnopqrstuvwxyz"

-- You can specify a step too:

-- [2,4..20 ] => returns even numbers up to 20
-- [3,6..20] => returns multiples of 3 up to 18

-- you can only specify one step, so you can't do stuff like square numbers

-- you can't do [20..1], but you can do [20,19 ..1]

-- careful with floats: [0.1, 0.3 .. 1] returns [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]  

-- you can create infinite lists by not specifying an upper limit

-- a better way to implement [13,26.. 24 * 13] would be: take 24 [13,26..]

-- Functions that produce infinite lists:

take 10 (cycle [1,2,3])

-- [1,2,3,1,2,3,1,2,3,1] 

take 10 (repeat 5)

--- [5,5,5,5,5,5,5,5,5,5] 

-- for this it's simpler to use the replicate function if you want the same element in a list

replicate 3 10 

-- [10,10,10]

-- LIST COMPREHENSIONS

-- To double all numbers in a 1..10 range:

[x*2 | x <- [1..10] ]

-- [2,4,6,8,10,12,14,16,18,20]  

-- Adding a condition(or predicate) to that comprehension. We only want elements which, when doubled, are greater or equal to 12

[x*2 | x <- [1..10], x >= 12]

-- To get all numbers from 50 to 100 whose remainder divided by 7 is 3:

[x | x <- [50..100], x `mod` 7 == 3]

-- [52,59,66,73,80,87,94]   

-- We want a comprehension that replaces each odd number greater than 10 with "BANG!" and each less than 10 with "BOOM!". If number is even, we throw it out.

boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

boomBangs [7..13]

-- ["BOOM!","BOOM!","BANG!","BANG!"]   

-- We can include several comma-separated predicates

[ x | x <- [10..20], x /= 13, x /= 15, x /= 19]  

--[10,11,12,14,16,17,18,20]  

-- Getting all possible products of combinatios from two lists

[x*y | x <- [2,5,10], y< [8, 10,11]  ]

--[16,20,22,40,50,55,80,100,110] 

-- To filter this

[ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

-- [55,80,100,110]

-- Epic combination of adjectives and nouns

let nouns = ["hobo", "frog", "pope"]
let adjectives = ["lazy", "grouchy", "scheming"]

[adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

-- ["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog", "grouchy pope","scheming hobo","scheming frog","scheming pope"]   

-- Writing our own version of length

length' xs = sum [1 | _ <- xs]

-- _ means that we don't care what we'll draw from the list. This function replaces every item of the list with 1 and sums it

-- Because strings are lists, we can use list comprehensions with them.

removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

-- removeNonUppercase "IdontLIKEFROGS"  ===> "ILIKEFROGS"   

-- Nested List Comprehensions

let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]

[ [ x | x <- xs, even x] | xs <- xxs ]

-- [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]  

-- ***** Tuples *****

-- Tuples are like lists but you know exactly how many values it has and its type depends on how many components it has and the types of components

-- To denote vectors meant to represent a shape. 

-- [(1,2),(8,11),(4,5)]

-- You can't use a pair and a triple in the same list. They also must be of a consistent type: e.g. you can't do [(1,2),("One", 2)]

-- You can use a wide variety of data: e.g. ("Christopher", "Walken", 55)

-- Tuples are more righid because each different size of tuple is its own type, so you can't write a general function to append an element to a tuple - you'd ahve to do it for a pair, a triple etc. indivdually

-- Example functions on pairs:

fst (8,11)

-- 8 - returns first component

fst ("Wow", false)

-- "Wow"

snd (8,11)

-- 11. Second component

zip [1,2,3,4,5,6] [5,5,5,5,5]

-- [(1,5),(2,5),(3,5),(4,5),(5,5)]
-- takes two lists and zips them together into one list by joining the matching elements into pairs. Useful for combining two lists or traversing two lists simultaneously

zip [1 .. 5] ["one", "two", "three", "four", "five"]  

-- [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")] 

-- If the lengths don't match it cuts off to match the length of the shorter one

zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]  

-- [(5,"im"),(3,"a"),(2,"turtle")]  

-- Because Haskell is lazy, we can zip infinite lists with finite lists

zip [1..] ["apple", "orange", "cherry", "mango"]  

--[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]


-- Which right angle has integers for all sides and all sides equal to or smaller than 10 has a perimeter of 24?

let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]

-- Adding the condition that they all have to be right angled triangles:

let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2 ]

-- Adding the condition that the perimeter has to be 24

let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]

-- ==> [(6,8,10)]. This is common practice in functional programming - you take a starting set of solutions then apply tranformations to those solutions and filter them until you get the right ones.