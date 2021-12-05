# Day 2

https://adventofcode.com/2021/day/3

These challenges involved processing binary strings, finding the most (or least) common value for each bit, and determining the right value based on the given criteria. You can run each solution using:

```
ruby part_1.rb
ruby part_2.rb
```

## Part 1

As with all of these, the first part was much more straightforward. To determine how common each value was for each bit, I decided to give it a score. Each `1` value added 1 to the score, and each `0` subtracted 1. This created an overall score where positive numbers mean `1` was most common and negative meant `0` was instead. Using these scores, I created a binary number for each rate based on their unique conditions (gamma wanted the most common, while epsilon was the least common) and multiplied them to get the power consumption.

## Part 2

This one really through me for a loop. I wanted to continue using binary numbers and the gamma and epsilon rates to filter the data. Since the oxygen generator rating was based on the most common, I thought I could re-use the gamma rate (which was also based on the most common value) to test each bit, filtering out those that didn't match. To do that, I compared using a bit mask[^1].

[^1]: There's a much easier way to compare bits by the way. Binary numbers have indexes, starting with the right most and continuing up. `a[index] == b[index]` is a much easier way then using the mask.

```ruby
# Loop over the number of bits we want to shift to create the mask
11.downto(0).each do |shift|
  bit_mask = 1 << shift

  # Select data where the bits match
  data.select do |binary|
    # Mask the gamma the current binary number and the gamma rate with the bit
    # mask. If they're equal, then the bit matches.
    binary & bit_mask == gamma_rate & bit_mask
  end

  # ... continue down each bit until the data set only has one value.
end
```

(Note, it took me a long time and a lot of research to get to this solution using binary. I definitely understand bit shifting and masking in a way I never did before.)

I did the same using the epsilon rate to get the CO2 scrubber rating and thought I had a valid answer. Unfortunately I was off. I spent a lot of time trying to figure out what I had messed up regarding binary numbers. Eventually I decided to do a more manual comparison, keeping the binary numbers as strings of characters rather than an actual number. But in the end, I got the same result as before and was more confused than ever.

Eventually I turned to Reddit to see if there was something I was missing. Turns out, there was. I was creating a score for each bit for the entire data set. So when I filtered on each bit, it was finding based on the most common for the all the data instead of just the data that remained. Armed with this realization, I adjusted my approach to calculate a score just for a specific bit and then filter from there, eventually getting to the solution in `part_2.rb`.
