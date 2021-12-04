increases = 0
previous_depth_window_sum = nil

File.foreach("./input.txt").each_cons(3) do |depths|
  current_depth_sum = depths.map(&:to_i).sum

  if previous_depth_window_sum.nil?
    previous_depth_window_sum = current_depth_sum
    next
  end

  increases += 1 if current_depth_sum > previous_depth_window_sum
  previous_depth_window_sum = current_depth_sum
end

puts "Number of increases: #{increases}"
