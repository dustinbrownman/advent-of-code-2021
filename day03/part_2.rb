def gamma_rate(bit_scores)
  p bit_scores
  bit_scores.map { |score| score >= 0 ? "1" : "0" }.join.to_i(2)
end

def epsilon_rate(bit_scores)
  bit_scores.map { |score| score < 0 ? "1" : "0" }.join.to_i(2)
end

def matching_bit?(a, b, bit_index = 0)
  a[bit_index] == b[bit_index]
end

def rating(report_numbers, test_rate)
  puts "Test rate:        #{test_rate.to_s(2)}"
  possible_ratings = report_numbers#.map { |report_number| report_number.to_i(2) }
  force_exit = false

  while !force_exit && possible_ratings.length > 1
    # puts "while loop"
    11.downto(0).each do |index|
      next if possible_ratings.length == 1
      puts "sample rating: #{possible_ratings.sample}"
      puts "current index: #{" " * (10 - index)}^" unless index == 11
      # puts "index loop #{index}"
      # puts "possible ratings length: #{possible_ratings.length}"
      possible_ratings = possible_ratings.select do |rating|
        matching_bit?(rating.to_i(2), test_rate, index)
      end
    end

    force_exit = true
  end

  possible_ratings.length == 1 ? possible_ratings.first : nil
end

scores = Array.new(12, 0)

binary_numbers = File.readlines("input.txt", chomp: true)

File.foreach("input.txt", chomp: true) do |binary_number|
  binary_number.split("").each_with_index do |bit, index|
    scores[index] += bit == "1" ? 1 : -1
  end
end

oxygen_generator_test_rate = gamma_rate(scores)
co2_scrubber_test_rate = epsilon_rate(scores)

oxygen_generator_rating = rating(binary_numbers, oxygen_generator_test_rate)
co2_scrubber_rating = rating(binary_numbers, co2_scrubber_test_rate)

puts "Oxygen generator test rate: #{oxygen_generator_test_rate.to_s(2)}"
puts "Oxygen generator rating: #{oxygen_generator_rating}"

puts "CO2 scrubber test rate: #{co2_scrubber_test_rate.to_s(2)}"
puts "CO2 scrubber rating: #{co2_scrubber_rating}"

puts "Solution: #{oxygen_generator_rating.to_i(2) * co2_scrubber_rating.to_i(2)}"

class DiagnosticReport
  def initialize(report_numbers)
    @report_numbers = report_numbers
  end

  def most_common_at(numbers, index)
    score = generate_score_for_index(numbers, index)
    return if score == 0
    score > 0 ? "1" : "0"
  end

  def least_common_at(numbers, index)
    score = generate_score_for_index(numbers, index)
    return if score == 0
    score < 0 ? "1" : "0"
  end

  def oxygen_generator_rating
    possible_ratings = @report_numbers

    (0..11).each do |index|
      return possible_ratings.first if possible_ratings.length == 1
      puts possible_ratings.count
      possible_ratings = possible_ratings.select do |rating|
        rating[index] == (most_common_at(possible_ratings, index) || "1")
      end
    end

    puts possible_ratings.count

    raise "Multiple possible oxygen generator ratings found" if possible_ratings.length > 1

    possible_ratings.first
  end

  def co2_scrubber_rating
    possible_ratings = @report_numbers

    (0..11).each do |index|
      return possible_ratings.first if possible_ratings.length == 1
      puts possible_ratings.count
      possible_ratings = possible_ratings.select do |rating|
        rating[index] == (least_common_at(possible_ratings, index) || "0")
      end
    end

    puts possible_ratings.count

    raise "Multiple possible oxygen generator ratings found" if possible_ratings.length > 1

    possible_ratings.first
  end

  private

  def generate_score_for_index(numbers, index)
    score = 0

    numbers.each do |number|
      case number[index]
      when "1" then score += 1
      when "0" then score -= 1
      end
    end

    score
  end

  def generate_scores(numbers)
    scores = Array.new(12, 0)

    numbers.each do |report_number|
      report_number.split("").each_with_index do |bit, index|
        scores[index] += bit == "1" ? 1 : -1
      end
    end

    scores
  end
end

report = DiagnosticReport.new(File.readlines("input.txt", chomp: true))
puts report.oxygen_generator_rating
puts report.co2_scrubber_rating

puts "Solution: #{report.oxygen_generator_rating.to_i(2) * report.co2_scrubber_rating.to_i(2)}"
