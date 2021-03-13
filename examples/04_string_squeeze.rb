# String#squeeze
#
# We can remove all of the repeated letters in a string
"Committees of bookkeepers in Mississippi".squeeze
# => "Comttes of bokepers in Misisipi"

# or do it with a nonsense string
"aaaAbaCcccCCCbbaAAAA".squeeze
# => "aAbaCcCbaA"

# or pass arguments to only squeeze specific characters
# so that only repeated s and k will be removed
"Committees of bookkeepers in Mississippi".squeeze("sk")
# => "Committees of bookeepers in Misisippi"