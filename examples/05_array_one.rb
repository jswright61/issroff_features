# Array#one?
#
# There is precisely one 2 here, so we'll get true
[1, 2, "string", :symbol, nil].one?(2)
# => true

# If there is more than one 2, we'll get false
[1, 2, "string", :symbol, nil, 2].one?(2)
# => false

# And obviously an empty array will return false
[].one?(:symbol)
# => false