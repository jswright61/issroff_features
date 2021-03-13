class Example
  def name
    "Integer#digits"
  end

  def tweet_body
    <<~TWEET_BODY
      8/ Day eight: Integer#digits gives us an array of the digits in a number.
      It reduces string allocations since we don't need to convert ints to a string
      and back, so has practical applications in cases like checksum formulas.
      It also can be useful in interview-type settings.
    TWEET_BODY
  end

  def example_01
    # Integer#digits will give us an array representing
      # all of the digits of that integer
      16_304.digits
      # => [4, 0, 3, 6, 1]
  end

  def example_02
    # One workaround we might've used for this functionality
    # is converting an int to a string, reversing, taking
    # the array of chars, and mapping String#to i
    16_304.to_s.reverse.chars.map(&:to_i)
    # => [4, 0, 3, 6, 1]
  end

  def example_03
    # Integer#digits can also take a parameter, which indicates
    # what base to convert the digits to (default is base 10)
    16_304.digits(16)
    # => [0, 11, 15, 3]
  end
end
