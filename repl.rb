#!/usr/bin/env ruby
# encoding: utf-8

class REPL
  @debug
  @commands
  @methods
  
  # Initialize
  def initialize(debug = false)
    @debug = debug
    @commands = []
    @methods = []
  end
  
  # Loop
  def start()
    if @commands.empty?
      puts "There are no commands"
    else
      loop do
        # Get vars
        print "Command>"
        input = gets.chomp
        command, *params = input.split /\s/


        # Get debug
        if (@debug)
          puts "---------------------------"
          puts "Command: " + command
          unless params.empty?
            puts "Params"
            params.each do |param|
              puts "  " + param
            end
          end
          puts "---------------------------"
        end

        # Evaluate vars
        if (index = @commands.index(command))
          method = @methods[index]
       
          if (self.methods.include?(method.to_sym))
            begin
              if params.empty?
                self.send(method)
              else
                self.send(method, params)
              end
            rescue => error
              puts error.message
              puts error.backtrace
            end
          else
            puts "No method error"
          end
        else 
          puts "Invalid command"
        end
      end
    end
  end
  
  # Add command
  def add_command(command, method)
    if @commands.include? command
      puts "That command already exists"
    else
      @commands.push command
      @methods.push method
    end
  end
  
  # Delete command
  def remove_command(command)
    if (index = @commands.index(command))
      @commands.delete_at(index)
      @methods.delete_at(index)
    else
      puts "No command error"
    end
  end
end
