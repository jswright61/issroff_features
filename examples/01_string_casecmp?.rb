class Example
  def name
    "String#casecmp?"
  end

  def tweet_body
    <<~TWEET_BODY
      1/ Starting us off, String#casecmp? does a case insensitve comparison of Strings
    TWEET_BODY
  end

  def example_01
    # Instead of
    "aLl DIffeRent CasING".downcase == "all DIFFERENT casing".downcase
    # => true
  end

  def example_02
    # We can use String#casecmp?
    "aLl DIffeRent CasING".casecmp?("all DIFFERENT casing")
    # => true
  end

  def example_03
    "different strings".casecmp?("WiLL ReTuRn FaLsE")
    # => false
  end
end
