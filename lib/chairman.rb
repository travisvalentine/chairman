require 'rubygems'
require 'sinatra/base'
# require 'json'
# require 'nokogiri'
# require 'fileutils'
# require 'logger'
# require 'io/console'

class Chairman
  attr_accessor :slides, :file

  def initialize(filename)
    puts "You've uploaded #{filename}"
    file = File.open(filename, mode="r+")
    verify(file)
  end

  def verify(file)
    file.lines.to_a[0...6].each { |line| puts "#{line}" }
    puts ""
    puts ""
    puts "Does this look like the file you want to showoff? (y/n)"
    input = gets.chomp
    case input.downcase
      when "y" then open_and_edit(file)
      when "n" then no
      else
        puts "That was invalid. Try again."
    end
  end

  def open_and_edit(file)
    file.rewind
    if file.size == 0
      puts "File is empty"
    else
      create_showoff_slides_for(file)
    end
  end

  def create_showoff_slides_for(file)
    t_file = Tempfile.new('filename_temp.txt')
    File.open(file, 'r') do |f|
      f.lines.each do |line|
        if line =~ /\A[#]/ || line =~ /!\[.*?\]\(.*?\.(png|jpeg|gif)\)/
          t_file.puts "!SLIDE\n"
        end
        t_file.puts line
      end
    end
    FileUtils.mv(t_file.path, "tagged-file.txt")
  end

  def no
    puts "what file would you like to turn into a presentation?"
    input = gets.chomp
    new_file = Chairman.new(input)
  end

end

test = Chairman.new("slidesA.md") 