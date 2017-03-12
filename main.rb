#!/usr/bin/env ruby
# encoding: utf-8

debug = false

comando_salir = ["salir", "fin", "abortar", "finalizar", "exit", "end", "abort", "finish"];

loop do
  print "Comando>"
  input = gets.chomp
  command, *params = input.split /\s/

  if debug
    puts "---------------------------"
  	puts "Comando: " + command
  	unless params.empty?
  	  puts "Parámetros"
      params.each do |param|
        puts "  " + param
      end
	end
  	puts "---------------------------"
  end
  
  if command == "ayuda"
    puts "Esta es la ayuda de la consola" + $/
  elsif command == "tarea"
    puts "Estoy realizando tarea" + $/
  elsif comando_salir.include? command
    abort
  else
    puts 'Comando inválido'
  end
end
