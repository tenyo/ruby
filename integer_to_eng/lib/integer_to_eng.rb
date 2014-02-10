class Integer

  # our conversion hash has all the english words we need to represent any number
  @@NUMBERS = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
                6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",
                11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen",
                16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty",
                30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety",
                100 => "hundred",
                1000 => "thousand",
                1_000_000 => "million",
                1_000_000_000 => "billion",
                10**12 => "trillion",
                10**15 => "quadrillion",
                10**18 => "quintillion",
                10**21 => "sextillion",
                10**24 => "septillion",
                10**27 => "octillion",
                10**30 => "nonillion",
                10**33 => "decillion",
              }

  # convert an integer number to english phrase (recursive)
  def to_eng
    input = self
    english_phrase = ""

    # we know this number - get it from the hash
    return @@NUMBERS[input] if input < 100 && @@NUMBERS.has_key?(input)

    # negative number
    return "negative #{input.abs.to_eng}" if input < 0

    # special case, e.g 25, 48, 99
    return "#{((input / 10) * 10).to_eng}-#{(input - (input / 10) * 10).to_eng}" if (21..99) === input

    # determine how big the number is (order of magnitude)
    divisor = @@NUMBERS.keys.sort[-1]  # start from the largest one we know
    while input < divisor
      input < 1000 ? divisor = 100 : divisor /= 1000
    end
    
    # call ourselves recursively for the quotient and remainder
    q, r = input.divmod(divisor)
    english_phrase << q.to_eng << " " << @@NUMBERS[divisor] << " "
    if r > 0
      english_phrase << "and " if r < 100
      english_phrase << r.to_eng
    end

    return english_phrase.split.join(" ")  # get rid of any multiple spaces
  end
  
end

