require "date"
class Example
  def name
    "DateTime#equal_same_date"
  end

  def tweet_body
    <<~TWEET_BODY
      11/ Was just noticing 3/11 is a fun date because 11 is 3 in binary. I guess
      only 1/1 and 2/10 share this property.

      So, I looked into the DateTime class and learned === on DateTimes returns true
      if two dates fall on the same day, regardless of their time.
    TWEET_BODY
  end

  def example_01
    # We can see this by creating two dates on the same day with different times
    DateTime.parse("2021-03-11 2:00") === DateTime.parse("2021-03-11 17:00")
    # => true
  end

  def example_02
    # Just to double check, we can change the year on the first date
    DateTime.parse("1901-03-11 2:00") === DateTime.parse("2021-03-11 17:00")
    # => false
  end

  def example_03
    # And note they're not equivalent when comparing with just ==
    DateTime.parse("2021-03-11 2:00") == DateTime.parse("2021-03-11 17:00")
    # =>> false
  end
end