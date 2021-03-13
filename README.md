# Exploring Various Ruby Features
This project started when [@JemmaIssroff](https://twitter.com/JemmaIssroff?s=20) decided to explore various methods in the Ruby Docs and tweet about a particular method she found interesting, fun, or particularly useful feach day in March. [Here is the thread](https://twitter.com/JemmaIssroff/status/1366398992356167684).

This repo is just a collection of her various method examples and explorations. In addition to the code (suitable for copying and pasting for explorations on your own), there is a utility included called "run_example.rb" that expects to recieve a single command line arument of the feature number. When properly executed, it will print a pretty good representation of the example, as well as evaluting it example and showing its output:
```ruby
$ run_example.rb 1
outputs:
# 01_string_casecmp?.rb
#	String#casecmp?

# tweet body:
#	1/ Starting us off, String#casecmp? does a case insensitve comparison of Strings


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
## Optional arguments
* pry leaves you in a pry session after executing the code. The last instantiated Example class is loaded and accessible as "example".
* all runs all available examples in alphabetical order.
* you can use "--" before any argument. It's optional, and basically ignored if present. It is allowed just for convention. __Note__ there is no space between the "--" and the argument. So "--pry" not "-- pry".
# Installing
 * After cloning the repo, run
```ruby
$ bundler
```
    There are just a couple of dependencies: pry and method_source
