# Array#assoc
#
# Say we're looking for a nested array in this array whose
# first element is 1
# We pass 1 as an argument to assoc
[1, [1,2,3], [3], nil].assoc(1)
# and we'll get back the nested array we wanted:
# => [1,2,3]

# If no nested array has its first element as the arg we pass,
# Array#assoc will return nil
[1, [1,2,3], [3], nil].assoc(7)
# => nil

# If multiple nested ararys have the arg as their first arg,
# Array#assoc will return the first nested array to match
[1, [1,2,3], [3], [1,5,6]].assoc(1)
# => [1,2,3]

# And of course, non-integers work here too!
["some", [:other, { kinds: 0 }], ["args"]].assoc(:other)
# => [:other, f:kinds=>01]
