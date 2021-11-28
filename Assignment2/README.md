Assignment 2
Sebastian Brumm

Deadline 1:
I think I added the 4 correct lines of code. I would be more sure if I could test more complex lambda calculus equations but I'm still a little rough on it.
I tested it with (\ x . S x) S 0 and it definitely gives the correct answer.
It was hard trying to figure out what exactly evalCBN and subst were doing but I think I figured it out through testing and carefully reading the comments.
Please let me know if there was something I did incorrectly.

Deadline 2:
Everything should be implemented, just not 100% just that ELet subst was implemented correctly with the id argument.

Deadline 3:
After finishing this assignment, I feel like I understand why there needs to be so much error checking and testing when it comes to implementing functions and larger programs. It took me a long time to figure out exactly what the rules of the list we implemented were and how to work around those rules when building the functions for task 2. In particular, I am very used to adding elements to the end of a list and being able to access a list or linked list from both sides whereas here we have a LIFO structure with elements being imput at the front, almost like a stack.
It also took me a bit to understand why we implement # to denote the end of the list, the reason being because we don't have a length function. Since we don't have a length function, there is no way to tell if the list only has one element left unless that element is #. This also answers the question of why #:# is not valid syntax while (#):# is.
A list cannot have two ends according to our rules, exlaining why #:# isn't valid but why is (#):#? This is a valid statement because (#) is actually a list of its own, so the first element in (#):# is a list and not the end of a list.
A lot of the functions that we implemented in solutions.lc would have been easier if there was a way to simply define a for each loop for the list. Most of my time for the functions was spent figuring out eaxactly how to iterate through the list and account for cases such as there only being one element in the list or the end of the list is reached. It took me hours to figure out that I could print out each element of the list while the function was recursively running, I initially thought that I could only print the completed list at the end.
Translating the LambdaNat5 code to Haskell code was easier than I thought it would be, the only issue I had was implementing insertion sort. My problem was that I had a base case in the insert function in LambdaNat5 while I didn't need it in the Haskell code, leading to a few weird cases and around an hour to figure it out. The only other thing I noticed is that we can't have # be part of the list because it is not recognized as an integer. So instead of checking if the element is # to denote the end of a list, I instead checked if there was only one element left in the list and then ended the recursion.
