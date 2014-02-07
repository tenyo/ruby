
class RomNum

  @@NUMERALS = { "I" => 1, "IV" => 4, "V" => 5, "IX" => 9, "X" => 10, 
                 "XL" => 40, "L" => 50, "XC" => 90, "C" => 100, 
                 "CD" => 400, "D" => 500, "CM" => 900, "M" => 1000 }

  def self.valid_roman?(numeral)
    # does some basic validation, needs more

    single_numerals = @@NUMERALS.keys.select { |x| x.size == 1 }

    # can only contain the listed numerals
    return false unless numeral =~ /^[#{@@NUMERALS.keys.join}]+$/

    # can't have more than 3 identical consecutive numerals
    regex = (single_numerals.map { |x| "#{x}{4,}" }).join('|')
    return false if numeral =~ /#{regex}/

    return true
  end
  
  # convert an integer to roman numeral
  def self.to_roman(input)
    converted_numeral = ""
    @@NUMERALS.values.sort.reverse.each do |num|
      while input >= num
        converted_numeral << @@NUMERALS.key(num)
        input -= num
      end
    end
    return converted_numeral
  end
  
  # convert roman to integer
  def self.to_i(input)
    input.upcase!
    abort "Incorrect roman numeral!" unless valid_roman?(input)

    converted_numeral = 0
    # sort a roman numeral array from longest to shortest (i.e. double numerals like IX or IV will be first)
    @@NUMERALS.keys.sort { |x,y| y.size <=> x.size }.each do |rom|
      if ( occurrences = input.scan(/#{rom}/).size ) > 0
        converted_numeral += occurrences * @@NUMERALS[rom]
        input.slice!(rom)	# remove all matching numerals, already accounted for
      end
    end
    return converted_numeral
  end
  
end

