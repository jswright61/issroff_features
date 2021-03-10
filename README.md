# Exploring Various Ruby Features
This project started when [@JemmaIssroff](https://twitter.com/JemmaIssroff?s=20) decided to explore various methods in the Ruby Docs and tweet about a particular method she found interesting, fun, or particularly useful feach day in March. [Here is the thread](https://twitter.com/JemmaIssroff/status/1366398992356167684).

This repo is just a collection of her various method examples and explorations. In addition to the code (suitable for copying and pasting for explorations on your own), there is a utility included called "run_example.rb" that expects to recieve a single command line arument of the feature number. When properly executed, it will print a pretty good representation of the example, as well as evaluting it example and showing its output:
```ruby
$ run_example.rb 1
outputs:
# File: 01_string_casecmp?.rb

# String#casecmp?
#
# Instead of
"aLl DIffeRent CasING".downcase == "all DIFFERENT casing".downcase
# => true
true

# We can use String#casecmp?
"aLl DIffeRent CasING".casecmp?("all DIFFERENT casing")
# => true
true

"different strings".casecmp?("WiLL ReTuRn FaLsE")
# => false
false
```