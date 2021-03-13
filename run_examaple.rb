#!/usr/bin/env ruby
require "pry"
require "method_source"

class RunExample
  attr_reader :example

  def initialize(args)
    determine_options(args)
    if @options[:help]
      # this goes first because if they want help we don't do anything else
      show_help
    elsif @options[:all] || @options[:index]
      run_examples
    else
      # no valid options => show help
      show_help
    end
    # if the selected pry then break here
    binding.pry if @options[:pry]
  end

  def determine_options(args)
    @options = {all: false, index: nil, pry: false, help: false}
    args.each do |a|
      # We're just gonna ignore double dashes because who really cares
      a = a.delete_prefix("--").downcase
      if a == "all"
        @options[:all] = true
      elsif a == "pry"
        @options[:pry] = true
      elsif a == "help"
        @options[:help] = true
        # no need to check other options, we're just printing help
        return

      elsif a.to_i.to_s.rjust(a.length, "0") == a
        @options[:index] = a.to_i
      end
    end
  end

  def files
    @files ||= begin
      files = Dir.glob("examples/*.rb").sort.map {|f| f.delete_prefix("examples/")}
      .select { |f| f.split("_").first.to_i > 0 }
      .map { |f| {name: f, index: f.split("_").first.to_i} }
    end
  end

  def handle_args
    file_num = @arg.to_i
    if file_num.to_s.rjust(@arg.length, "0") == @arg
      file = files.find { |f| f[:index] == file_num }
      if file
        run_examples(file[:name])
      else
        puts "Cannot locate file with prefix #{file_num}"
      end
    elsif @arg == "all"
      files.each do |f|
        run_examples(f[:name])
        puts "\n\n"
      end
    else
      print_help
    end
  end

  def run_examples
    files_to_run = if @options[:all]
      ex_files = files
    else
      files.select {|f| f[:index] == @options[:index]}
    end
    files_to_run.each do |f|
      load "examples/#{f[:name]}"
      @example = Example.new
      example_header(f[:name])
      ex_methods = (example.methods - Object.methods).select { |xampl| xampl[0..7] == "example_" }.sort
      ex_methods.each do |ex_meth|
        Example.instance_method(ex_meth).source.split("\n")[1..-2].each { |l| puts l.delete_prefix("    ") }
        puts colorize(example.send(ex_meth).to_s, :red)
        puts ""
      end
      puts ""
      example.cleanup if example.respond_to?(:cleanup)
    end
  end

  def show_help
    puts "A valid @argument is expected"
    puts "Arguments:"
    puts "\tAny integer will run the file for that day"
    puts "\t\t run_exmple.rb 03 # runs the example for the 3rd"
    puts "\t--all will run all examples"
    puts "\t--help displays this message"
    puts "Note: double dashes in front of arguments are allowed but not required"
  end

  private

  COLORS = {red: 31, green: 32, yellow: 33, blue: 34, pink: 35, light_blue: 36}.freeze

  def colorize(str, color = :red)
    code = COLORS[color.to_sym] || 31
    str ||= "nil"
    "\e[#{code}m#{str}\e[0m"
  end

  def example_header(file_name)
    puts colorize("# #{file_name}\n#\t#{example.name}\n", :pink)
    puts colorize("# tweet body:", :blue)
    example.tweet_body.split("\n").each {|l| puts colorize("#\t#{l}", :blue)}
    puts"\n\n"
  end
end

run_ex = RunExample.new(ARGV)
