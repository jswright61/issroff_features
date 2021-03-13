class Example
  def name
    "Numeric#divmod"
  end

  def tweet_body
    <<~TWEET_BODY
      3/ Day three: We sometimes need both the quotient and remainder of a division
      operation. Instead of calculating them both separately, Numeric#divmod
      returns an array of two elements representing the quotient and remainder
    TWEET_BODY
  end

  def example_01
    # 100 -= 6 * 16 + 4
    100.divmod(6)
    # -> [16, 4]
  end

  def example_02
    # 1 = 3 * 0 + 1
    1.divmod(3)
    # -> [0, 1]
  end

  def example_03
    # It works with floats too!
    12.34.divmod(1.2)
    # -> [10, 0.3400000000000003]
  end
end
