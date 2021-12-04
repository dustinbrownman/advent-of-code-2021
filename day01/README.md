# Day 1

https://adventofcode.com/2021/day/1

The goal of these puzzles was to track the increases and decreases in the provided depths. Use the following commands to run each solution:

```
ruby part_1.rb
ruby part_2.rb
```

## Part 1

This was pretty simple. The key was keeping track of the previous depth to compare to the current one. It also required a special clause to handle the first measurement since we didn't want to count that as an "increase". I also used `File.foreach` as the more performant[^1] way of going over the file.

[^1]: Okay, so in this case it's probably not actually more performant. But it reads the file in such a way that it can handle much larger files more easily.

## Part 2

This required looking at a sliding window of depths and comparing their sum with the previous window's sum. At first I was keeping track of the sliding window manually, building it up and then shifting and pushing as I iterated. But then I remembered that Ruby had a built in way to handle this with `each_cons` (had to look it up). I was surprised to see that `foreach` still worked as I would have expected I needed the entire array to use `each_cons`, but it looks like Ruby was clever enough to handle that for me.

With the sliding window being provided, I only needed to add the sum and then repeat the process for the first part.
