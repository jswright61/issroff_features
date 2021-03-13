class Example
  def name
    "Array#one?"
  end

  def tweet_body
    <<~TWEET_BODY
      5/ Day five: Array#one? tells us whether precisely one element of an array
      matches an argument
    TWEET_BODY
  end

  def example_01
    # There is precisely one 2 here, so we'll get true
    [1, 2, "string", :symbol, nil].one?(2)
    # => true
  end

  def example_02
    # If there is more than one 2, we'll get false
    [1, 2, "string", :symbol, nil, 2].one?(2)
    # => false
  end

  def example_03
    # And obviously an empty array will return false
    [].one?(:symbol)
    # => false
  end
end
