class Example
  def name
    "Heredocs"
  end

  def tweet_body
    <<~TWEET_BODY
      7/ Week one! There are three different ways to start Heredocs: "<<", "<<-"
      and "<<~". They each allow different indentations. I tried out a funky way
      of explaining this within the heredocs themselves
    TWEET_BODY
  end

  def example_01
    non_indented_end_identifier = <<NO_DASH
      A heredoc with just << (no - or ~) expects the end identifier to be all the way
      to the right
NO_DASH
  end

  def example_02
    ugly_indented_code = <<NO_DASH
          This does not read well for indented code
NO_DASH
  end

  def example_03
    indented_end_identifier = <<-STRAIGHT_DASH
      The «- syntax lets us indent the end identifier
    STRAIGHT_DASH
  end

  def example_04
    too_much_whitespace = <<-STRAIGHT_DASH
      But it will also track indented strings
        with a whole lot
          of whitespace
    STRAIGHT_DASH
    # => "       But it will also track indented strings\n         with a whole lot\n
    #        of whitespace\n"
  end

  def example_05
    less_whitespace = <<~SQUIGGLY_DASH
      Squiggly dash allows for indented end identifier
        And indents the content of the whole string
          To align with the least indented part of the string
    SQUIGGLY_DASH
    # => "Squiggly dash allows for indented end identifier\n And indents the content
    # of the whole string\n To align with the least indented part of the string\n"
  end
end
