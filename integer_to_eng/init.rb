$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'integer_to_eng'


loop do
  puts "\nEnter a number: "
  break if (input_number = gets.chomp) =~ /quit|exit/i
  puts input_number.to_i.to_eng
end

