#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'repl'

class REPL
  def exit
    abort
  end
  
  def help
    puts "Help"
  end
  
  def hello
    puts "Hello world!"
  end
end

repl = REPL.new()

repl.add_command("exit", "exit")
repl.add_command("help", "help")
repl.add_command("hello", "hello")

repl.start()
