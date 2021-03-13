ClientsController = Class.new
class Example
  def name
    "# String#delete_prefix"
  end

  def tweet_body
    <<~TWEET_BODY
      6/ Sixth day (Happy birthday, dad!):
      String#delete_prefix and String#delete_suffix are both faster than String#sub or
      String#gsub. Useful for parsing input, and perhaps even metaprogramming
    TWEET_BODY
  end

  def example_01
    # An example where we receive user input
    # prefixed with `Input: `
    "Input: some sample input".delete_prefix("Input: ")
    # => "some sample input"
  end

  def example_02
    # It might be helpful to know the type of controller
    # without needing the suffix 'Controller'
    ClientsController.inspect.delete_suffix("Controller")
    # => "Clients"
  end

  def example_03
    # And just to confirm, if the suffix doesn't exist,
    # we won't delete anything
    "some string".delete_suffix("without this suffix")
    # => "some string"
  end
end
