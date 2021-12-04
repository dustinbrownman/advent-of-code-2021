# Day 2

https://adventofcode.com/2021/day/2

This puzzle involved tracking the position of the submarine as it traversed using the set of instructions in the input. The solution was the depth multiplied by the horizontal distance traveled. You can run each solution using the following:

```
ruby part_1.rb
ruby part_2.rb
```

## Part 1

I decided to use a class to represent the submarine in this problem. Classes give a convenient place to track state (the depth and distance) and define behavior to manipulate that state. It was maybe overkill for this problem, but it made for a smooth transition into part 2.

I also used Ruby pattern matching just because I wanted to give it a spin. I could have just as easily used a regular case statement.

## Part 2

For this solution, I first refactored my class a bit to make changing the behavior that much easier. For the previous solution, the class had one method that defined all the movement. But now that the definition of the commands (up, down, forward), having those each as their own method made sense. I then added `aim` as something another piece of state for the class to track and then changed how each command worked.

To run the correct method, I made an allow-list of commands. If the command was allowed, I `send` it to the object to run. This is probably more clever than it's worth, but fine enough for this kind of exercise (this isn't something I'd likely do in a production code situation).
