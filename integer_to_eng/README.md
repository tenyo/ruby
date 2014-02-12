## Coverter from integers to English phrases
Based on http://rubyquiz.com/quiz25.html

Extends the Integer class with a to_eng method

### Use in you app like this:
    require 'integer_to_eng'

### Demo:
    $ ruby init.rb

    Enter a number: 
    2014
    two thousand fourteen
    
    Enter a number: 
    -15
    negative fifteen
    
    Enter a number: 
    100000000000000
    one hundred trillion
    
### A more useful case where we get the latest US public debt number from TreasuryDirect and spell it out:
    $ ruby usdebt.rb 
    The US debt is currently $17,258,793,918,103
That is seventeen trillion two hundred fifty-eight billion seven hundred ninety-three million nine hundred eighteen thousand one hundred three US Dollars

