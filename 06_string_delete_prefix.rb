# String#delete_prefix
# String#delete_suffix
#
# An example where we receive user input
# prefixed with `Input: `
"Input: some sample input".delete_prefix("Input: ")
# => "some sample input"

# It might be helpful to know the type of controller
# without needing the suffix 'Controller'
ClientsController = Class.new(); ClientsController.inspect.delete_suffix("Controller")
# => "Clients"

# And just to confirm, if the suffix doesn't exist,
# we won't delete anything
"some string".delete_suffix("without this suffix")
# => "some string"