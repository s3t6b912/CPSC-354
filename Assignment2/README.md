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
