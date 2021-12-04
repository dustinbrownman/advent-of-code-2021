increases = 0
previous_depth = nil

File.foreach("./input.txt") do |line|
  depth = line.to_i

  if previous_depth.nil?
    previous_depth = depth
    next
  end

  increases += 1 if depth > previous_depth
  previous_depth = depth
end

puts "Number of increases: #{increases}"
