class Example
  def name
    "Array#*"
  end

  def tweet_body
    <<~TWEET_BODY
      9/ Ninth day: Almost forgot about this with all the @wnb_rb excitement today!

      Array#* behaves differently based on arg type - join for Strings and mult for ints.

      I knew about ints, but the String behavior is new to me. Unsure I find it more
      readable than Array#join... thoughts?
    TWEET_BODY
  end

  def example_01
    # If we pass Array#* a String argument, we'll get a join equivalent
    # with the passed String as our separator
    [1, :sym, nil, "str"] * ", "
    # => "1, sym, str"
  end

  def example_02
    # Just confirming it's the exact same as a join
    [1, :sym, nil, "str"] * ", " == [1, :sym, nil, "str"].join(", ")
    # => true
  end

  def example_03
    # Whereas if we pass an int, we'll get the Array
    # repeated that number of times
    [1, :sym, nil, "str"] * 2
    # => [1, :sym, nil, "str", 1, :sym, nil, "str"]
  end
end