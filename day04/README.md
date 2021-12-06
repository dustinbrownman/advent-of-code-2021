# Day 4

https://adventofcode.com/2021/day/4

In this challenge I had to determine which bingo cards would win given a set of numbers. You can run each solution using:

```
ruby part_1.rb
ruby part_2.rb
```

## Part 1

This was a much needed breath of fresh air from yesterday's binary fiasco. For part 1, I first focused on being able to parse the input. I knew I was going to want to put the info for each card into some kind of object, but I wasn't sure what that would look like.

Once I had the board being parsed, I decided to create a class to encapsulate the behavior of the board. Using a two-dimensional array to hold the values seemed an obvious choice, which also made passing each row of numbers in easy. The first challenge was to figure out how to "mark" a space when that number was drawn. To do this, I decided to do some good ol' test-driven development. This made implementing the `mark` method so simple that I decided to keep it for the rest for the rest of the behavior. Test for win conditions were added and I had all the elements I need to solve the problem.

I did run into a small issue where my parsing didn't work quite right (I was ignoring the first row of each card). I was able to see this by creating a `to_s` method to easily print out each card to see what it contained.

Oh, special shout out to [GitHub Copilot](https://copilot.github.com/)! Because of it I learned a new Ruby method that made checking the horizontal points trivial: [`transpose`](https://apidock.com/ruby/v2_6_3/Array/transpose)!

## Part 2

This is where using the class really shined. Even with the changed conditions, my class didn't have to change at all. I was able to just change the conditions for searching for winners in the script and found the solution.
