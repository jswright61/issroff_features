# String#casecmp?
#
# Instead of
"aLl DIffeRent CasING".downcase == "all DIFFERENT casing".downcase
# => true

# We can use String#casecmp?
"aLl DIffeRent CasING".casecmp?("all DIFFERENT casing")
# => true

"different strings".casecmp?("WiLL ReTuRn FaLsE")
# => false
