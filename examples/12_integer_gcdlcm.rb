class Example
  def name
    "Integer#gcdlcm"
  end

  def tweet_body
    <<~TWEET_BODY
      12/ Day 12: Integer#gcdlcm gives us the greatest common divisor and least
      common multiple of two ints. I don't know if there are practical use cases
      for this outside of something like building a calculator / math application.
      Any other ideas?
    TWEET_BODY
  end

  def example_01
    # Integer#gccncm gives us an array
    # of two elements: [gcd, lcm]
    24.gcdlcm(16)
    # => [8, 48]
  end

  def example_02
    13.gcdlcm(7)
    # => [1, 91]
  end

  def example_03
    # There are also Integer#gcd and
    # Integer#lcm to give us either or
    24.gcd(16)
    # => 8
  end

  def example_04
    24.lcm(16)
    # => 48
  end
end