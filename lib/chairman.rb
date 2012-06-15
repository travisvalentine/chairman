require 'rubygems'
require 'sinatra/base'
require 'json'
require 'nokogiri'
require 'fileutils'
require 'logger'
require 'io/console'

class Chairman
  attr_accessor :slides, :file

  def initialize(filename)
    puts "You've uploaded #{filename}"
    file = File.open(filename, mode="r+")
    verify(file)
  end

  # def open_and_edit(file)
  #   file.rewind
  #   file = File.open(file, 'r+') {
  #     slides = file.lines.select{ |line| line =~ /\A[#]/ } #|*]/ }
  #     slides.each{ |slide| 
  #       puts("<!SLIDE>test")
  #     }
  #   }
  # end

  def verify(file)
    file.lines.each { |line| puts "#{line}" }
    puts ""
    puts ""
    puts "Is this the file you want to showoff? (y/n)"
    input = gets.chomp
    case input.downcase
      when "y" then find_slides_in(file) # open_and_edit(file)
      when "n" then no
      else
        puts "That was invalid. Try again."
    end
  end

  def find_slides_in(file)
    file.rewind
    if file.size == 0
      puts "File is empty"
    else
      puts "Here are some possible slides we found:"
      slides = file.lines.select{ |line| line =~ /\A[#]/ } #|*]/ }
      slides.each { |slide| puts "#{slide}" }
    end
    add_showoff_tags_to(slides, file)
  end

  def add_showoff_tags_to(slides, file)
    file.write('a')
  end

  def no
    puts "what file would you like to turn into a presentation?"
    input = gets.chomp
    new_file = Chairman.new(input)
  end

end

test = Chairman.new("slidesA.md")