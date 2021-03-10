#!/usr/bin/env ruby
require "pry"

class Examples
  def initialize(arg)
    # We're just gonna ignore double dashes because who really cares
    @arg = arg.delete_prefix("--").downcase
  end

  def files
    @files ||= Dir.glob("*.rb").select { |f| f.split("_").first.to_i > 0 }
      .map { |f| {name: f, index: f.split("_").first.to_i} }
  end

  def handle_args
    file_num = @arg.to_i
    if file_num.to_s.rjust(@arg.length, "0") == @arg
      file = files.find { |f| f[:index] == file_num }
      if file
        print_file(file[:name])
      else
        puts "Cannot locate file with prefix #{file_num}"
      end
    elsif @arg == "all"
      files.each do |f|
        print_file(f[:name])
        puts "\n\n"
      end
    else
      print_help
    end
  end

  def print_file(file_name)
    puts "# File: #{file_name}\n\n"
    examples = File.read(file_name)&.split("\n\n").to_a
    examples.each do |xampl|
      puts xampl
      p eval(xampl)
      puts ""
    end
  end

  def print_help
    puts "A valid @argument is expected"
    puts "Arguments:"
    puts "\tAny integer will run the file for that day"
    puts "\t\t run_exmple.rb 03 # runs the example for the 3rd"
    puts "\t--all will run all examples"
    puts "\t--help displays this message"
    puts "Note: double dashes in front of arguments are allowed but not required"
  end
end

ex = Examples.new(ARGV[0])
ex.handle_args
