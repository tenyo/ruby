$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'net/http'
require 'rexml/document'
require 'integer_to_eng'

# Showcase the Integer to_eng method to spell out the US debt

# get the latest US debt numbers from here
url = 'http://www.treasurydirect.gov/NP/debt/rss'

# get the XML data as a string
xml_data = Net::HTTP.get_response(URI.parse(url)).body

# extract the latest debt numbers
doc = REXML::Document.new(xml_data)
most_recent_numbers = doc.elements["rss/channel/item/content:encoded"].to_s
us_debt = most_recent_numbers[/Outstanding:.*\./].gsub(/[^\d,]/, "")  # comma-separated number

puts "The US debt is currently $#{us_debt}"
puts "That is #{us_debt.gsub(/,/, "").to_i.to_eng} US Dollars \n\n"

