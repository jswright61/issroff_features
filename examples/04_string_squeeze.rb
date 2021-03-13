class Example
  def name
    "String#squeeze"
  end

  def tweet_body
    <<~TWEET_BODY
      4/ Fourth up: String#squeeze removes consecutive letter repetition from a
      string
    TWEET_BODY
  end

  def example_01
    # We can remove all of the repeated letters in a string
    "Committees of bookkeepers in Mississippi".squeeze
    # => "Comites of bokepers in Misisipi"
  end

  def example_02
    # or do it with a nonsense string
    "aaaAbaCcccCCCbbaAAAA".squeeze
    # => "aAbaCcCbaA"
  end

  def example_03
    # or pass arguments to only squeeze specific characters
    # so that only repeated s and k will be removed
    "Committees of bookkeepers in Mississippi".squeeze("sk")
    # => "Committees of bookeepers in Misisippi"
  end
end
