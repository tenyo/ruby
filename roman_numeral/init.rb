$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'romnum'


loop do
  puts "\nEnter a number or roman numeral to convert: "
  break if (input_numeral = gets.chomp.upcase) == "QUIT"
  if input_numeral =~ /^\d+$/
    puts RomNum.to_roman(input_numeral.to_i)
  elsif RomNum.valid_roman? input_numeral
    puts RomNum.to_i(input_numeral)
  else
    puts "Not a valid number or roman numeral!"
  end
end

