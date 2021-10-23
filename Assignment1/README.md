Assignment 1
Sebastian Brumm 9/21/2021
Readme for deadline 1

All functionality for deadline 1 should be implemented in both parts 1 and 2.
The code was tested through the main function in part 1 and passing the equation 1-2+3 in part 2.
Both returned what was expected.
The only part where I am unsure is whether I was also supposed to implement unary subtraction for deadline 1.
The main thing I learned from this assignment so far is how similar using this type of coding is to discrete math.

Update for deadline 2
All functionality has been added. For part 2, the two other operators that I added were absolute value and mod. I'm not too sure about the order of operations for them so I just put them to be first in the order of operations.
I tested the calculator with the example code in the document and some other minor variations for each operator. One thing I noticed was that |(-3)| did not want to work whereas |-3| worked just fine. Same with -(3) and ^-3 though that might be due to the Calculator.hs file.
The arithmetic.hs file was tested through the code in the main function. For ii_int, I could not get the if statement working to check if the input was negative so it currently will give a runtime error if the input is negative. Everything else should be working correctly.
