class SantaList
  attr_accessor :input, :list_checker
  def initialize(input, list_checker=ListCheck1)
    @input = input.each_line
    @list_checker = list_checker
  end

  def nice
    input.select { |line|
      list_checker.new(line).nice?
    }
  end
end

class ListCheck
  attr_accessor :line

  def initialize(line)
    @line = line
    @line.chomp!
  end

  def nice?
    true
  end
end

class ListCheck1 < ListCheck
  CONSONANTS  = "bcdfghjklmnpqrstvwxyz"
  VOWELS      = "aeiou"
  BAD_STRINGS = %w(ab cd pq xy)

  def nice?
    three_vowels? &&
    double_letter? &&
    no_bad_strings?
  end

  def three_vowels?
    line.delete(CONSONANTS).length >= 3
  end

  def double_letter?
    !! /(.)\1/.match(line)
  end

  def no_bad_strings?
    BAD_STRINGS.select { |bad| line.include? bad }.none?
  end
end

class ListCheck2 < ListCheck
  def nice?
    two_pairs? &&
    repeat_letters_with_a_letter_between?
  end

  def two_pairs?
    !! /(..).*\1/.match(line)
  end

  def repeat_letters_with_a_letter_between?
    !! /(.).\1/.match(line)
  end
end

santa_list = SantaList.new(ARGF, ListCheck2)
puts santa_list.nice

