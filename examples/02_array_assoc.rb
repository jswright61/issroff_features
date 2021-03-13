class Example
  def name
    "Array#assoc"
  end

  def tweet_body
    <<~TWEET_BODY
      2/ Second up, Array#assoc takes an argument, and finds the first element of
      the Array which is itself an Array whose first element is the argument. That
      sounds a little confusing, I'll let the code clear it up:
    TWEET_BODY
  end

  def example_01
    # Say we're looking for a nested array in this array whose
    # first element is 1
    # We pass 1 as an argument to assoc
    [1, [1, 2, 3], [3], nil].assoc(1)
    # and we'll get back the nested array we wanted:
    # => [1,2,3]
  end

  def example_02
    # If no nested array has its first element as the arg we pass,
    # Array#assoc will return nil
    [1, [1, 2, 3], [3], nil].assoc(7)
    # => nil
  end

  def example_03
    # If multiple nested ararys have the arg as their first arg,
    # Array#assoc will return the first nested array to match
    [1, [1, 2, 3], [3], [1, 5, 6]].assoc(1)
    # => [1,2,3]
  end

  def example_04
    # And of course, non-integers work here too!
    ["some", [:other, {kinds: 0o1}], ["args"]].assoc(:other)
    # => [:other, {:kinds=>1}]
  end
end
