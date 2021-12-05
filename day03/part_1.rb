def gamma_rate(bit_scores)
  bit_scores.map { |score| score > 0 ? "1" : "0" }.join.to_i(2)
end

def epsilon_rate(bit_scores)
  bit_scores.map { |score| score < 0 ? "1" : "0" }.join.to_i(2)
end

def power_consumption(bit_scores)
  gamma_rate(bit_scores) * epsilon_rate(bit_scores)
end

scores = Array.new(12, 0)

File.foreach("input.txt", chomp: true) do |binary_number|
  binary_number.split("").each_with_index do |bit, index|
    scores[index] += bit == "1" ? 1 : -1
  end
end

puts "Power consumption: #{power_consumption(scores)}"
