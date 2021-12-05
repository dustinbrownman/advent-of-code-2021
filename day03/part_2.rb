class DiagnosticReport
  def initialize(report_numbers)
    @report_numbers = report_numbers
  end

  def oxygen_generator_rating
    possible_ratings = @report_numbers

    (0..11).each do |index|
      return possible_ratings.first if possible_ratings.length == 1

      possible_ratings = possible_ratings.select do |rating|
        rating[index] == (most_common_at(possible_ratings, index) || "1")
      end
    end

    raise "Multiple possible oxygen generator ratings found" if possible_ratings.length > 1

    possible_ratings.first
  end

  def co2_scrubber_rating
    possible_ratings = @report_numbers

    (0..11).each do |index|
      return possible_ratings.first if possible_ratings.length == 1

      possible_ratings = possible_ratings.select do |rating|
        rating[index] == (least_common_at(possible_ratings, index) || "0")
      end
    end

    raise "Multiple possible oxygen generator ratings found" if possible_ratings.length > 1

    possible_ratings.first
  end

  private

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
end

report = DiagnosticReport.new(File.readlines("input.txt", chomp: true))

puts "Oxygen generator rating: #{report.oxygen_generator_rating}"
puts "CO2 scrubber rating:     #{report.co2_scrubber_rating}"

puts "Solution: #{report.oxygen_generator_rating.to_i(2) * report.co2_scrubber_rating.to_i(2)}"
